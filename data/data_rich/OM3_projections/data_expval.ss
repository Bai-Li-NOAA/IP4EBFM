#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Thu Aug 04 15:27:27 2022
#_expected_values
#C data file for simple example
#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
1985 #_StartYr
2012 #_EndYr
1 #_Nseas
 12 #_months/season
2 #_Nsubseasons (even number, minimum is 2)
1.00001 #_spawn_month
-1 #_Ngenders: 1, 2, -1  (use -1 for 1 sex setup with SSB multiplied by female_frac parameter)
7 #_Nages=accumulator age, first age is always age 0
1 #_Nareas
3 #_Nfleets (including surveys)
#_fleet_type: 1=catch fleet; 2=bycatch only fleet; 3=survey; 4=predator(M2) 
#_sample_timing: -1 for fishing fleet to use season-long catch-at-age for observations, or 1 to use observation month;  (always 1 for surveys)
#_fleet_area:  area the fleet/survey operates in 
#_units of catch:  1=bio; 2=num (ignored for surveys; their units read later)
#_catch_mult: 0=no; 1=yes
#_rows are fleets
#_fleet_type fishery_timing area catch_units need_catch_mult fleetname
 1 -1 1 1 0 fleet1  # 1
 3 1 1 2 0 survey1  # 2
 3 1 1 2 0 survey2  # 3
#Bycatch_fleet_input_goes_next
#a:  fleet index
#b:  1=include dead bycatch in total dead catch for F0.1 and MSY optimizations and forecast ABC; 2=omit from total catch for these purposes (but still include the mortality)
#c:  1=Fmult scales with other fleets; 2=bycatch F constant at input value; 3=bycatch F from range of years
#d:  F or first year of range
#e:  last year of range
#f:  not used
# a   b   c   d   e   f 
#_catch:_columns_are_year,season,fleet,catch,catch_se
#_Catch data: yr, seas, fleet, catch, catch_se
-999 1 1 176046 0.05
1985 1 1 146424 0.05
1986 1 1 138443 0.05
1987 1 1 33593.1 0.05
1988 1 1 2121.21 0.05
1989 1 1 918.53 0.05
1990 1 1 6977.32 0.05
1991 1 1 25978.9 0.05
1992 1 1 51840.2 0.05
1993 1 1 111895 0.05
1994 1 1 27990.6 0.05
1995 1 1 7557.99 0.05
1996 1 1 22771 0.05
1997 1 1 61134.2 0.05
1998 1 1 210975 0.05
1999 1 1 208964 0.05
2000 1 1 187889 0.05
2001 1 1 114661 0.05
2002 1 1 12658.7 0.05
2003 1 1 62103.9 0.05
2004 1 1 146555 0.05
2005 1 1 554198 0.05
2006 1 1 2.79688e+06 0.05
2007 1 1 2.23069e+06 0.05
2008 1 1 360051 0.05
2009 1 1 432124 0.05
2010 1 1 572953 0.05
2011 1 1 905699 0.05
2012 1 1 883826 0.05
-9999 0 0 0 0
#
#
 #_CPUE_and_surveyabundance_observations
#_Units:  0=numbers; 1=biomass; 2=F; 30=spawnbio; 31=recdev; 32=spawnbio*recdev; 33=recruitment; 34=depletion(&see Qsetup); 35=parm_dev(&see Qsetup)
#_Errtype:  -1=normal; 0=lognormal; >0=T
#_SD_Report: 0=no sdreport; 1=enable sdreport
#_Fleet Units Errtype SD_Report
1 1 0 0 # fleet1
2 0 0 0 # survey1
3 0 0 0 # survey2
#_year month index obs err
1990 10 2 3.39585e+06 0.1 #_orig_obs: 661143 survey1
1991 10 2 2.66537e+06 0.1 #_orig_obs: 4.52286e+06 survey1
1992 10 2 1.42268e+06 0.1 #_orig_obs: 6.7024e+06 survey1
1993 10 2 1.49618e+06 0.1 #_orig_obs: 1.57378e+06 survey1
1994 10 2 1.53627e+06 0.1 #_orig_obs: 1.08989e+06 survey1
1995 10 2 1.13535e+06 0.1 #_orig_obs: 1.70713e+06 survey1
1996 10 2 3.48773e+06 0.1 #_orig_obs: 1.37675e+06 survey1
1997 10 2 5.54557e+06 0.1 #_orig_obs: 1.8355e+06 survey1
1998 10 2 4.09617e+06 0.1 #_orig_obs: 1.2999e+07 survey1
1999 10 2 2.64598e+06 0.1 #_orig_obs: 6.17151e+06 survey1
2000 10 2 2.09823e+06 0.1 #_orig_obs: 2.9689e+06 survey1
2001 10 2 2.33827e+06 0.1 #_orig_obs: 1.35378e+06 survey1
2002 10 2 1.27585e+06 0.1 #_orig_obs: 1.73694e+06 survey1
2003 10 2 2.88046e+06 0.1 #_orig_obs: 1.6412e+06 survey1
2004 10 2 8.34831e+06 0.1 #_orig_obs: 1.44056e+06 survey1
2005 10 2 7.37767e+06 0.1 #_orig_obs: 1.33767e+07 survey1
2006 10 2 5.11434e+06 0.1 #_orig_obs: 1.61603e+07 survey1
2007 10 2 2.863e+06 0.1 #_orig_obs: 2.98429e+06 survey1
2008 10 2 1.3912e+06 0.1 #_orig_obs: 4.39754e+06 survey1
2009 10 2 3.50844e+06 0.1 #_orig_obs: 1.13145e+06 survey1
2010 10 2 4.81087e+06 0.1 #_orig_obs: 1.82551e+06 survey1
2011 10 2 3.39999e+06 0.1 #_orig_obs: 6.29915e+06 survey1
2012 10 2 2.15802e+06 0.1 #_orig_obs: 2.7229e+06 survey1
1985 4 3 1.00199e+06 0.1 #_orig_obs: 1.49352e+06 survey2
1986 4 3 414782 0.1 #_orig_obs: 1.44274e+06 survey2
1987 4 3 296369 0.1 #_orig_obs: 872326 survey2
1988 4 3 241479 0.1 #_orig_obs: 205219 survey2
1989 4 3 402145 0.1 #_orig_obs: 151078 survey2
1990 4 3 1.25667e+06 0.1 #_orig_obs: 139356 survey2
1991 4 3 944674 0.1 #_orig_obs: 533665 survey2
1992 4 3 481129 0.1 #_orig_obs: 2.07828e+06 survey2
1993 4 3 534996 0.1 #_orig_obs: 1.31668e+06 survey2
1994 4 3 550238 0.1 #_orig_obs: 456402 survey2
1995 4 3 397432 0.1 #_orig_obs: 570570 survey2
1996 4 3 1.2887e+06 0.1 #_orig_obs: 632183 survey2
1997 4 3 2.02977e+06 0.1 #_orig_obs: 433557 survey2
1998 4 3 1.45383e+06 0.1 #_orig_obs: 1.55374e+06 survey2
1999 4 3 919918 0.1 #_orig_obs: 4.95153e+06 survey2
2000 4 3 740897 0.1 #_orig_obs: 1.77116e+06 survey2
2001 4 3 843401 0.1 #_orig_obs: 747600 survey2
2002 4 3 435965 0.1 #_orig_obs: 506065 survey2
2003 4 3 1.05843e+06 0.1 #_orig_obs: 676836 survey2
2004 4 3 3.10503e+06 0.1 #_orig_obs: 434581 survey2
2005 4 3 2.68371e+06 0.1 #_orig_obs: 1.58913e+06 survey2
2006 4 3 2.00038e+06 0.1 #_orig_obs: 6.80618e+06 survey2
2007 4 3 1.14022e+06 0.1 #_orig_obs: 2.03217e+06 survey2
2008 4 3 489731 0.1 #_orig_obs: 1.1362e+06 survey2
2009 4 3 1.3266e+06 0.1 #_orig_obs: 834352 survey2
2010 4 3 1.81215e+06 0.1 #_orig_obs: 316508 survey2
2011 4 3 1.27053e+06 0.1 #_orig_obs: 1.28707e+06 survey2
2012 4 3 805760 0.1 #_orig_obs: 1.69517e+06 survey2
-9999 1 1 1 1 # terminator for survey observations 
#
0 #_N_fleets_with_discard
#_discard_units (1=same_as_catchunits(bio/num); 2=fraction; 3=numbers)
#_discard_errtype:  >0 for DF of T-dist(read CV below); 0 for normal with CV; -1 for normal with se; -2 for lognormal; -3 for trunc normal with CV
# note: only enter units and errtype for fleets with discard 
# note: discard data is the total for an entire season, so input of month here must be to a month in that season
#_Fleet units errtype
# -9999 0 0 0.0 0.0 # terminator for discard data 
#
0 #_use meanbodysize_data (0/1)
#_COND_0 #_DF_for_meanbodysize_T-distribution_like
# note:  type=1 for mean length; type=2 for mean body weight 
#_yr month fleet part type obs stderr
#  -9999 0 0 0 0 0 0 # terminator for mean body size data 
#
# set up population length bin structure (note - irrelevant if not using size data and using empirical wtatage
2 # length bin method: 1=use databins; 2=generate from binwidth,min,max below; 3=read vector
1 # binwidth for population size comp 
1 # minimum size in the population (lower edge of first bin and size at age 0.00) 
60 # maximum size in the population (lower edge of last bin) 
0 # use length composition data (0/1)
# see manual for format of length composition data 
#
7 #_N_age_bins
 1 2 3 4 5 6 7
1 #_N_ageerror_definitions
 -1 -1 -1 -1 -1 -1 -1 -1
 0 0 0 0 0 0 0 0
#_mintailcomp: upper and lower distribution for females and males separately are accumulated until exceeding this level.
#_addtocomp:  after accumulation of tails; this value added to all bins
#_combM+F: males and females treated as combined gender below this bin number 
#_compressbins: accumulate upper tail by this number of bins; acts simultaneous with mintailcomp; set=0 for no forced accumulation
#_Comp_Error:  0=multinomial, 1=dirichlet
#_ParmSelect:  parm number for dirichlet
#_minsamplesize: minimum sample size; set to 1 to match 3.24, minimum value is 0.001
#
#_mintailcomp addtocomp combM+F CompressBins CompError ParmSelect minsamplesize
0 1e-07 1 0 0 0 0.001 #_fleet:1_fleet1
0 1e-07 1 0 0 0 0.001 #_fleet:2_survey1
0 1e-07 1 0 0 0 0.001 #_fleet:3_survey2
1 #_Lbin_method_for_Age_Data: 1=poplenbins; 2=datalenbins; 3=lengths
# sex codes:  0=combined; 1=use female only; 2=use male only; 3=use both as joint sexxlength distribution
# partition codes:  (0=combined; 1=discard; 2=retained
#_yr month fleet sex part ageerr Lbin_lo Lbin_hi Nsamp datavector(female-male)
1985  1 1  0 0 1 -1 -1 800  376.281 215 130.221 55.3071 16.4464 4.44013 2.30394
1986  1 1  0 0 1 -1 -1 800  130.572 338.509 205.862 88.0695 26.2765 7.06731 3.644
1987  1 1  0 0 1 -1 -1 800  206.902 107.88 300.852 129.847 38.8126 10.4033 5.30327
1988  1 1  0 0 1 -1 -1 800  257.742 169.719 96.4338 194.009 58.7279 15.5997 7.76844
1989  1 1  0 0 1 -1 -1 800  462.043 129.779 93.4602 38.5282 54.4849 14.6084 7.09611
1990  1 1  0 0 1 -1 -1 800  628.086 107.442 32.9667 17.2181 4.99301 6.25845 3.03517
1991  1 1  0 0 1 -1 -1 800  344.808 362.523 67.5311 14.9874 5.50827 1.41912 3.22281
1992  1 1  0 0 1 -1 -1 800  173.076 268.492 306.187 41.097 6.418 2.10193 2.628
1993  1 1  0 0 1 -1 -1 800  330.444 112.059 186.652 152.317 14.427 2.0219 2.07898
1994  1 1  0 0 1 -1 -1 800  368.609 208.038 75.9806 89.9765 51.3339 4.3634 1.69803
1995  1 1  0 0 1 -1 -1 800  279.29 261.828 160.899 42.3834 35.2222 20.3774 0
1996  1 1  0 0 1 -1 -1 800  598.098 75.9122 77.4974 34.4511 6.38676 4.7152 2.93934
1997  1 1  0 0 1 -1 -1 800  528.536 211.503 29.0934 21.3901 6.69311 1.10635 1.67787
1998  1 1  0 0 1 -1 -1 800  313.986 323.455 138.685 13.6281 7.073 1.98919 1.18416
1999  1 1  0 0 1 -1 -1 800  231.589 230.166 252.585 76.4881 5.27538 2.47531 1.42193
2000  1 1  0 0 1 -1 -1 800  272.765 171.317 181.448 140.868 29.9782 1.86814 1.75612
2001  1 1  0 0 1 -1 -1 800  379.474 167.607 112.464 84.2968 45.8979 8.8128 1.44781
2002  1 1  0 0 1 -1 -1 800  190.287 320.921 153.399 73.5122 38.5169 18.751 4.61349
2003  1 1  0 0 1 -1 -1 800  521.867 72.4442 132.416 45.6761 15.4379 7.20825 4.95026
2004  1 1  0 0 1 -1 -1 800  629.924 119.861 17.8366 23.2583 5.6531 1.71744 1.74916
2005  1 1  0 0 1 -1 -1 800  393.811 325.622 64.9385 6.78561 6.27017 2.57277 0
2006  1 1  0 0 1 -1 -1 800  340.307 243.659 187.054 24.3639 1.87505 1.71698 1.02419
2007  1 1  0 0 1 -1 -1 800  301.517 267.041 157.542 66.2109 7.68866 0 0
2008  1 1  0 0 1 -1 -1 800  186.659 285.434 229.522 75.0635 20.3142 3.00746 0
2009  1 1  0 0 1 -1 -1 800  566.145 64.8876 99.3557 53.4812 12.3426 3.78767 0
2010  1 1  0 0 1 -1 -1 800  515.831 222.011 24.9384 24.9247 9.42279 2.09583 0.776342
2011  1 1  0 0 1 -1 -1 800  338.775 313.294 128.792 9.24401 9.89469 0 0
2012  1 1  0 0 1 -1 -1 800  283.647 244.542 211.805 54.0423 5.96403 0 0
1990  10 2  0 0 1 -1 -1 800  725.141 59.6407 9.54263 3.45233 0.875726 1.34757 0
1991  10 2  0 0 1 -1 -1 800  511.015 258.069 30.9167 0 0 0 0
1992  10 2  0 0 1 -1 -1 800  357.867 266.385 157.905 14.6625 2.00671 0.577631 0.596502
1993  10 2  0 0 1 -1 -1 800  576.304 93.4159 80.3777 45.2668 3.77128 0.466515 0.397342
1994  10 2  0 0 1 -1 -1 800  576.429 156.204 29.684 24.3281 13.3553 0 0
1995  10 2  0 0 1 -1 -1 800  484.771 218.52 70.0316 12.7787 9.28826 4.61029 0
1996  10 2  0 0 1 -1 -1 800  722.974 44.0742 23.4249 7.20859 2.31858 0 0
1997  10 2  0 0 1 -1 -1 800  658.337 126.368 9.03048 6.26429 0 0 0
1998  10 2  0 0 1 -1 -1 800  495.997 244.058 53.9933 3.66002 2.29216 0 0
1999  10 2  0 0 1 -1 -1 800  442.93 210.418 119.286 27.3656 0 0 0
2000  10 2  0 0 1 -1 -1 800  509.509 152.901 83.6022 44.7815 9.2063 0 0
2001  10 2  0 0 1 -1 -1 800  595.062 125.767 43.6708 22.6057 10.8149 2.0794 0
2002  10 2  0 0 1 -1 -1 800  376.191 305.036 76.029 25.2371 11.5664 4.93811 1.00209
2003  10 2  0 0 1 -1 -1 800  694.433 46.2041 43.8191 10.4495 3.09843 1.27304 0.722725
2004  10 2  0 0 1 -1 -1 800  723.154 65.782 5.0581 4.55225 1.45399 0 0
2005  10 2  0 0 1 -1 -1 800  556.432 218.076 25.4919 0 0 0 0
2006  10 2  0 0 1 -1 -1 800  553.422 177.397 62.8807 6.3001 0 0 0
2007  10 2  0 0 1 -1 -1 800  524.081 204.957 54.4509 16.5105 0 0 0
2008  10 2  0 0 1 -1 -1 800  381.15 275.087 111.921 25.0518 6.79054 0 0
2009  10 2  0 0 1 -1 -1 800  718.245 38.5699 29.5194 10.8211 2.24048 0.604236 0
2010  10 2  0 0 1 -1 -1 800  654.241 131.336 7.31806 7.10504 0 0 0
2011  10 2  0 0 1 -1 -1 800  525.947 224.736 45.0969 4.21987 0 0 0
2012  10 2  0 0 1 -1 -1 800  501.066 199.218 83.9497 15.7658 0 0 0
1985  4 3  0 0 1 -1 -1 800  602.756 140.683 39.8707 11.7089 3.38916 1.00736 0.58511
1986  4 3  0 0 1 -1 -1 800  321.596 340.587 96.9274 28.6735 8.32698 2.46548 1.42289
1987  4 3  0 0 1 -1 -1 800  498.174 105.861 137.528 40.9485 11.9366 3.53209 2.0195
1988  4 3  0 0 1 -1 -1 800  540.731 144.977 38.3049 53.1132 15.6916 4.60664 2.57514
1989  4 3  0 0 1 -1 -1 800  674.862 77.1782 25.8428 7.34231 10.1341 3.00318 1.63762
1990  4 3  0 0 1 -1 -1 800  736.394 51.3033 7.32335 2.63687 0.746187 1.03336 0.562461
1991  4 3  0 0 1 -1 -1 800  542.251 232.294 20.1492 3.08429 1.10572 0.314612 0.801425
1992  4 3  0 0 1 -1 -1 800  398.305 251.885 133.883 12.4003 1.88815 0.682475 0.956792
1993  4 3  0 0 1 -1 -1 800  608.49 84.2718 65.6525 37.0369 3.41528 1.13384 0
1994  4 3  0 0 1 -1 -1 800  605.471 139.262 23.6923 19.3546 12.2205 0 0
1995  4 3  0 0 1 -1 -1 800  520.407 198.688 56.7993 10.3142 8.36415 5.42726 0
1996  4 3  0 0 1 -1 -1 800  735.909 38.0586 18.0926 5.54749 2.39274 0 0
1997  4 3  0 0 1 -1 -1 800  677.193 110.488 12.3185 0 0 0 0
1998  4 3  0 0 1 -1 -1 800  527.902 222.167 44.5814 3.02953 1.53037 0.473805 0.315702
1999  4 3  0 0 1 -1 -1 800  480.99 195.226 100.203 23.5808 0 0 0
2000  4 3  0 0 1 -1 -1 800  544.94 139.803 69.2797 37.1888 7.70376 0.52859 0.556205
2001  4 3  0 0 1 -1 -1 800  622.325 112.198 35.1776 18.2183 12.0813 0 0
2002  4 3  0 0 1 -1 -1 800  413.738 284.185 63.197 20.8787 10.6744 7.32681 0
2003  4 3  0 0 1 -1 -1 800  711.969 40.3114 34.3778 8.18733 2.69689 1.38881 1.06901
2004  4 3  0 0 1 -1 -1 800  733.969 57.0315 3.96898 5.03028 0 0 0
2005  4 3  0 0 1 -1 -1 800  581.316 197.053 18.5144 1.34243 1.20405 0.570422 0
2006  4 3  0 0 1 -1 -1 800  561.214 168.517 63.3157 5.82587 0.429894 0.697178 0
2007  4 3  0 0 1 -1 -1 800  527.141 196.713 57.1749 18.9706 0 0 0
2008  4 3  0 0 1 -1 -1 800  412.839 259.302 98.5797 22.4098 6.86952 0 0
2009  4 3  0 0 1 -1 -1 800  728.35 34.3967 25.0442 9.39726 2.81204 0 0
2010  4 3  0 0 1 -1 -1 800  668.279 118.74 6.36395 6.61651 0 0 0
2011  4 3  0 0 1 -1 -1 800  545.399 209.027 41.2729 2.07513 2.2258 0 0
2012  4 3  0 0 1 -1 -1 800  520.772 186.21 77.5662 15.4511 0 0 0
-9999  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
#
0 #_Use_MeanSize-at-Age_obs (0/1)
#
0 #_N_environ_variables
# -2 in yr will subtract mean for that env_var; -1 will subtract mean and divide by stddev (e.g. Z-score)
#Yr Variable Value
#
0 # N sizefreq methods to read 
#
0 # do tags (0/1)
#
0 #    morphcomp data(0/1) 
#  Nobs, Nmorphs, mincomp
#  yr, seas, type, partition, Nsamp, datavector_by_Nmorphs
#
0  #  Do dataread for selectivity priors(0/1)
# Yr, Seas, Fleet,  Age/Size,  Bin,  selex_prior,  prior_sd
# feature not yet implemented
#
999

