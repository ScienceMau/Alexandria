using DynamicalSystems, SharedArrays, MAT, Statistics, OrdinaryDiffEq, ProgressMeter, DelimitedFiles, CairoMakie
mkdir("Matlab_files")
mkdir("data_files")
mkdir("Figures_files")
@inline @inbounds function MathModel(u,par,t)

	######################
	## parameters
	#####################
	A = par[1];
	w = 1.0;

	du1 = 4*u[1]*u[2]^2-u[1]+A*cos(w*t);
 	du2 = -4*u[1]^2*u[2]+u[2]+A*sin(w*t);
	
	return SVector{2}(du1, du2);
end


function text_screen(text)
	
	for i in text
	print(i)		
	sleep(0.05)
	end
end

function text_screen(text)
	for i in text
	print(i)		
	sleep(0.05)
	end
end

function Temporal_Series(MM, u0,TIME1, as)
	
	
		diffeq = (reltol = 1e-9, abstol = 1e-9)
		ds   = ContinuousDynamicalSystem(MM,u0,[as];diffeq)
		tr, t   = trajectory(ds, TIME1; Ttr=Int(round(0.9*TIME1)), Δt = 0.01 )
    	x=tr[:,1];
    	y=tr[:,2];

		f = Figure(fontesize=28, resolution = (600, 400))
		ax = Axis(f[1, 1])
		lines!(ax, x, y, color = :black)
		save("Figures_files/Phase_map_$(as)_.png",f)

    	writedlm("data_files/time_series_$as.txt", [x y])
    	matwrite("Matlab_files/TS_$(as)_.mat", Dict(
		"A1" => collect(x),
		"A2" => collect(y),
  	 	))
	
end


function Poincare_map(MM, u0,TIME1, as)
	
	
	diffeq = (reltol = 1e-9, abstol = 1e-9)
	ds   = ContinuousDynamicalSystem(MM,u0,[as];diffeq)
	tr, t   = trajectory(ds, TIME1; Ttr=(1e6)*π, Δt = 2π)
   	x=tr[:,1];
    y=tr[:,2];
	
	f = Figure(fontesize=28, resolution = (400, 400))
	ax = Axis(f[1, 1],
    title = "Poincarè Map",
    xlabel = "x",
    ylabel = "y"
	)
	scatter!(ax, x, y, markersize=2.0, color = range(0, 1, length=length(x)), colormap = Reverse(:thermal))
	save("Figures_files/Poincare_map_$(as)_.png",f)

	writedlm("data_files/Poincare_$(as)_.txt", [x y])
	matwrite("Matlab_files/Poincare_map_$(as)_.mat", Dict(
		"A1" => collect(x),
		"A2" => collect(y),
		"time" => collect(t),
  	 	))

end


 function BasinsOfAttraction(MM, par, xi, xf, yi, yf, NCI, u0)

 	diffeq = (alg = Vern9(), abstol = 1e-9, reltol = 1e-9)
 	ds     = ContinuousDynamicalSystem(MM, u0, [par]; diffeq)
 	x0     = range(xi, xf, length = NCI)
 	y0     = range(yi, yf, length = NCI)
 	mapper = AttractorsViaRecurrences(ds, (x0, y0); sparse = false, Δt =0.001)
 	basins, attractors = basins_of_attraction(mapper; show_progress = true)

	 for k in keys(attractors)
        x, y = columns(attractors[k])
		writedlm("data_files/att_$(k)_b_$(par).txt", [x y])
		matwrite("Matlab_files/att_$(k)_b_$(par).mat", Dict(
			"x1" => collect(x),
			"y1" => collect(y),
			))
    end

	writedlm("data_files/_bsn__$(par).txt", basins')
    matwrite("Matlab_files/_bsn__$(par).mat", Dict(
        "bsn" => collect(basins'),
        ))
 
		fig = heatmap(x0, y0, basins')
		save("Figures_files/Basin.png", fig)	
	
end

	as = 1.0
	u0 = [0.0, 0.0]
	text_screen("# Time Series calculation and graphical build #\n")

	Temporal_Series(MathModel, u0,2000, as)
	text_screen("# Poincare Map calculation and graphical build #\n")
	Poincare_map(MathModel, u0,10000000*pi, as)
	BasinsOfAttraction(MathModel, as, -1.0, 1.0, -1.0, 1.0, 200, u0)

text_screen("######################################\n")
text_screen("## Developed by:Mauricio A. Ribeiro ##\n")
text_screen("## Email:mau.ap.ribeiro@gmail.com   ##\n")
text_screen("######################################\n")
