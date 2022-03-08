# Plot BAM outputs using FishGraph (http://doi.org/10.7289/V5HT2M98)

library(devtools)
devtools::install_github("RobCheshire-NOAA/FishGraph")
library(FishGraph)

working_dir <- here::here("data", "AtlanticMenhadenSA")

##### Start fresh ###########
graphics.off()
.SavedPlots <- NULL



##### Read in the data from the ASCII .rdat file: #####
##### Commented out in this example because FishGraph already has the menhaden data set in memory.
menhaden <- dget(file.path(working_dir, "am019.rdat"))

##### Common arguments in FishGraph functions. Convenient to define them once.
ptype=NULL #NULL (no quotes) for no plots saved; other options: "pdf", "wmf", "eps"
dtype=TRUE  #draft type
ctype=TRUE  #color type
########## Open a graphics device ###########
windows(width = 8, height = 8, record = TRUE)
pdf(file = file.path(working_dir, "bam_all_figures.pdf"), onefile = T)

########## Call the functions #########################

FishGraph:::BSR.time.plots(menhaden, start.drop = 10, draft=dtype, use.color=ctype, graphics.type=ptype, legend.pos="top")

#windows(width = 10, height = 8, record = TRUE)
# Comp.plots(menhaden, draft=dtype, use.color=ctype, graphics.type=ptype, corr=T, c.min=0.2) #Error in Comp.plots(menhaden, draft = dtype, use.color = ctype, graphics.type = ptype,  :object 'm12dp' not found

#windows(width = 8, height = 10, record = TRUE)
FishGraph:::Comp.yearly.plots(menhaden, draft=dtype, use.color=ctype, graphics.type=ptype, plot.neff=FALSE, print.neff=FALSE,
                  compact = TRUE, print.n=TRUE)

FishGraph:::Cohort.plots(menhaden,draft=dtype, graphics.type=ptype)

FishGraph:::Index.plots(menhaden, draft=dtype, use.color=ctype, graphics.type=ptype)

menhaden$parms$F40=0.54 #add to parms, calculated post-assessment
menhaden$parms$F50=0.38 #add to parms, calculated post-assessment
FishGraph:::F.time.plots(menhaden, draft=dtype, use.color=ctype, graphics.type=ptype,
             F.references=list(a="F40",b=c("Fmsy","F50")))

FishGraph:::Landings.plots(menhaden, draft=dtype, use.color=ctype, graphics.type=ptype,
               L.units=c(menhaden$info$units.landings, menhaden$info$units.landings,"1000 fish","1000 fish"), D.units="1000 dead fish", L.obs.pre=FALSE)

FishGraph:::Growth.plots(menhaden, draft=dtype, use.color=ctype, graphics.type=ptype, plot.all = TRUE)

#windows(width = 8, height = 6, record = TRUE)
# PerRec.plots(menhaden, draft=dtype, use.color=ctype, graphics.type=ptype,
#              user.PR = list("SPR", "ypr.lb.gutted"), F.references=list("Fmsy","F40")) #Error in min(x) : invalid 'type' (list) of argument

FishGraph:::Eq.plots(menhaden, draft=dtype, use.color=ctype, graphics.type=ptype,
         F.references=list("Fmsy", "F40"))

FishGraph:::StockRec.plots(menhaden, draft=dtype, use.color=ctype, graphics.type=ptype,
               draw.lowess = FALSE, start.drop = 10, units.rec="number age-0 fish")

#windows(width = 6, height = 4, record = TRUE, xpos = 10, ypos = 10)
FishGraph:::Selectivity.plots(menhaden, draft=dtype, use.color=ctype, graphics.type=ptype, plot.points=T)

FishGraph:::NFZ.age.plots(menhaden,draft=dtype, use.color=ctype, graphics.type=ptype,
              user.plots="N.age.mdyr", start.drop=10)

FishGraph:::CLD.total.plots(menhaden, draft=dtype, use.color=ctype, graphics.type=ptype, first.year = "1965",
                units.CLD.w=menhaden$info$units.landings, CLD.w.references=list(NULL,"msy.klb", NULL),
                plot.proportion = TRUE)

#windows(width = 8, height = 8, record = TRUE)
FishGraph:::Phase.plots(menhaden, start.drop=10, draft=dtype, use.color=ctype, graphics.type=ptype, year.pos=2)

FishGraph:::Parm.plots(menhaden, graphics.type=ptype)

FishGraph:::Bound.vec.plots(menhaden, draft=dtype, graphics.type=ptype)

source(here::here("data", "AtlanticMenhadenSA", "projection", "Proj-menhaden-constant landings NLTS rec.r"))

dev.off()
graphics.off()
