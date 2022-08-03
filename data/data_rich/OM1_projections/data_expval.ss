#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Wed Aug 03 09:16:08 2022
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
-999 1 1 129618 0.05
1985 1 1 621779 0.05
1986 1 1 298977 0.05
1987 1 1 393896 0.05
1988 1 1 429094 0.05
1989 1 1 466529 0.05
1990 1 1 490333 0.05
1991 1 1 454393 0.05
1992 1 1 324843 0.05
1993 1 1 255939 0.05
1994 1 1 226829 0.05
1995 1 1 341118 0.05
1996 1 1 270341 0.05
1997 1 1 374030 0.05
1998 1 1 416590 0.05
1999 1 1 290537 0.05
2000 1 1 185643 0.05
2001 1 1 250936 0.05
2002 1 1 235988 0.05
2003 1 1 234648 0.05
2004 1 1 221975 0.05
2005 1 1 232309 0.05
2006 1 1 262107 0.05
2007 1 1 209843 0.05
2008 1 1 173204 0.05
2009 1 1 189751 0.05
2010 1 1 265375 0.05
2011 1 1 215010 0.05
2012 1 1 168543 0.05
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
1990 10 2 1.21322e+06 0.74 #_orig_obs: 2.17248e+06 survey1
1991 10 2 870497 0.75 #_orig_obs: 457211 survey1
1992 10 2 866210 0.76 #_orig_obs: 654267 survey1
1993 10 2 854129 0.73 #_orig_obs: 2.742e+06 survey1
1994 10 2 978793 0.77 #_orig_obs: 1.24859e+06 survey1
1995 10 2 1.0742e+06 0.74 #_orig_obs: 765889 survey1
1996 10 2 1.00918e+06 0.58 #_orig_obs: 1.06592e+06 survey1
1997 10 2 958179 0.59 #_orig_obs: 798920 survey1
1998 10 2 787095 0.88 #_orig_obs: 467336 survey1
1999 10 2 815277 0.61 #_orig_obs: 762429 survey1
2000 10 2 917896 0.66 #_orig_obs: 1.26881e+06 survey1
2001 10 2 972042 0.83 #_orig_obs: 181093 survey1
2002 10 2 969793 0.59 #_orig_obs: 2.26419e+06 survey1
2003 10 2 980787 0.68 #_orig_obs: 433759 survey1
2004 10 2 1.18149e+06 0.73 #_orig_obs: 655693 survey1
2005 10 2 976481 0.59 #_orig_obs: 1.34118e+06 survey1
2006 10 2 974784 0.67 #_orig_obs: 848202 survey1
2007 10 2 951962 0.59 #_orig_obs: 853227 survey1
2008 10 2 1.00829e+06 0.63 #_orig_obs: 1.12118e+06 survey1
2009 10 2 958022 0.61 #_orig_obs: 1.08938e+06 survey1
2010 10 2 826894 0.8 #_orig_obs: 704446 survey1
2011 10 2 659111 0.65 #_orig_obs: 1.47644e+06 survey1
2012 10 2 589074 0.59 #_orig_obs: 472946 survey1
1985 4 3 2.20681e+06 1.15 #_orig_obs: 1.24882e+06 survey2
1986 4 3 1.75477e+06 1.14 #_orig_obs: 1.99917e+06 survey2
1987 4 3 1.971e+06 1.18 #_orig_obs: 1.57746e+06 survey2
1988 4 3 3.17158e+06 1.14 #_orig_obs: 1.6475e+06 survey2
1989 4 3 2.99569e+06 1.18 #_orig_obs: 1.23925e+06 survey2
1990 4 3 2.51209e+06 1.15 #_orig_obs: 3.96243e+06 survey2
1991 4 3 1.79593e+06 1.16 #_orig_obs: 1.23766e+06 survey2
1992 4 3 1.79095e+06 1.16 #_orig_obs: 4.05255e+06 survey2
1993 4 3 1.76435e+06 1.19 #_orig_obs: 2.78881e+06 survey2
1994 4 3 2.02514e+06 1.14 #_orig_obs: 2.0545e+06 survey2
1995 4 3 2.23096e+06 1.13 #_orig_obs: 489338 survey2
1996 4 3 2.08419e+06 1.2 #_orig_obs: 2.63447e+06 survey2
1997 4 3 1.98619e+06 1.22 #_orig_obs: 2.0764e+06 survey2
1998 4 3 1.63356e+06 0.4 #_orig_obs: 1.79828e+06 survey2
1999 4 3 1.68989e+06 0.43 #_orig_obs: 1.68709e+06 survey2
2000 4 3 1.89691e+06 0.36 #_orig_obs: 2.76477e+06 survey2
2001 4 3 2.01176e+06 0.38 #_orig_obs: 3.00164e+06 survey2
2002 4 3 2.00264e+06 0.43 #_orig_obs: 1.72283e+06 survey2
2003 4 3 2.02438e+06 0.36 #_orig_obs: 1.02429e+06 survey2
2004 4 3 2.44333e+06 0.38 #_orig_obs: 1.11484e+06 survey2
2005 4 3 2.00634e+06 0.39 #_orig_obs: 1.45828e+06 survey2
2006 4 3 2.01048e+06 0.42 #_orig_obs: 1.1028e+06 survey2
2007 4 3 1.96005e+06 0.42 #_orig_obs: 2.63809e+06 survey2
2008 4 3 2.07637e+06 0.45 #_orig_obs: 3.14237e+06 survey2
2009 4 3 1.97027e+06 0.41 #_orig_obs: 1.21002e+06 survey2
2010 4 3 1.70293e+06 0.39 #_orig_obs: 2.20188e+06 survey2
2011 4 3 1.35285e+06 0.38 #_orig_obs: 3.28081e+06 survey2
2012 4 3 1.21011e+06 0.44 #_orig_obs: 2.47554e+06 survey2
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
50 # maximum size in the population (lower edge of last bin) 
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
1985  1 1  0 0 1 -1 -1 800  60.6636 233.665 374.457 101.517 22.236 5.11069 2.35122
1986  1 1  0 0 1 -1 -1 800  47.4825 248.298 406.083 73.84 17.3587 6.93765 0
1987  1 1  0 0 1 -1 -1 800  62.0708 195.5 429.778 92.3943 14.1596 3.82492 2.27283
1988  1 1  0 0 1 -1 -1 800  113.67 254.081 321.625 88.9354 16.6345 3.02409 2.0312
1989  1 1  0 0 1 -1 -1 800  76.6249 347.767 313.39 46.9198 11.4298 2.59285 1.2756
1990  1 1  0 0 1 -1 -1 800  49.3898 238.39 454.111 49.0155 6.32094 2.77239 0
1991  1 1  0 0 1 -1 -1 800  36.5106 211.298 435.135 105.116 9.5705 2.37023 0
1992  1 1  0 0 1 -1 -1 800  49.1746 173.422 436.344 114.599 23.109 2.41774 0.933833
1993  1 1  0 0 1 -1 -1 800  58.4929 232.413 358.328 118.033 25.6561 7.0767 0
1994  1 1  0 0 1 -1 -1 800  68.7631 226.177 396.203 79.924 21.7024 7.23036 0
1995  1 1  0 0 1 -1 -1 800  73.1145 259.517 361.767 84.8255 14.3071 6.46852 0
1996  1 1  0 0 1 -1 -1 800  58.9956 257.482 396.754 68.7973 13.5509 4.42007 0
1997  1 1  0 0 1 -1 -1 800  55.253 224.596 418.346 85.2695 12.3531 4.18223 0
1998  1 1  0 0 1 -1 -1 800  48.3894 237.278 398.721 94.8554 16.5349 4.22134 0
1999  1 1  0 0 1 -1 -1 800  58.0016 204.963 426.908 87.3499 17.7285 5.04868 0
2000  1 1  0 0 1 -1 -1 800  69.2562 237.679 372.134 98.7757 16.7181 5.43699 0
2001  1 1  0 0 1 -1 -1 800  67.4869 251.927 378.512 79.8323 17.4146 3.31017 1.51736
2002  1 1  0 0 1 -1 -1 800  60.7338 242.808 399.955 78.1771 13.6036 3.36765 1.35458
2003  1 1  0 0 1 -1 -1 800  58.9709 228.097 405.958 88.668 18.3053 0 0
2004  1 1  0 0 1 -1 -1 800  72.0361 224.848 389.852 92.6075 16.4664 4.18997 0
2005  1 1  0 0 1 -1 -1 800  50.4348 266.835 374.089 87.2767 16.831 4.53362 0
2006  1 1  0 0 1 -1 -1 800  51.4439 190.53 451.745 85.3396 16.1763 4.76497 0
2007  1 1  0 0 1 -1 -1 800  55.5325 225.041 376.165 119.519 18.3034 5.43968 0
2008  1 1  0 0 1 -1 -1 800  59.7143 217.477 402.931 91.0452 23.2582 5.57468 0
2009  1 1  0 0 1 -1 -1 800  54.7634 233.598 388.096 98.9061 17.9192 6.7175 0
2010  1 1  0 0 1 -1 -1 800  46.8858 218.386 414.623 94.6023 19.5713 5.93168 0
2011  1 1  0 0 1 -1 -1 800  40.0254 203.467 423.623 106.399 19.8293 6.65574 0
2012  1 1  0 0 1 -1 -1 800  43.5125 184.218 422.795 118.069 24.0311 4.98591 2.38768
1990  10 2  0 0 1 -1 -1 800  597.443 158.225 38.482 4.45455 1.39514 0 0
1991  10 2  0 0 1 -1 -1 800  560.363 178.12 47.1073 12.1809 2.22873 0 0
1992  10 2  0 0 1 -1 -1 800  623.971 121.191 39.7732 11.1249 3.94035 0 0
1993  10 2  0 0 1 -1 -1 800  622.503 136.241 27.4217 9.61718 4.21736 0 0
1994  10 2  0 0 1 -1 -1 800  646.534 117.286 27.0171 5.78911 3.37432 0 0
1995  10 2  0 0 1 -1 -1 800  644.62 125.36 22.1228 5.57844 1.37843 0.584899 0.354755
1996  10 2  0 0 1 -1 -1 800  614.596 147.789 29.7767 5.49462 1.56335 0.780214 0
1997  10 2  0 0 1 -1 -1 800  619.513 138.165 32.8454 9.47688 0 0 0
1998  10 2  0 0 1 -1 -1 800  595.376 159.538 33.4247 8.59407 2.20935 0.515072 0.343696
1999  10 2  0 0 1 -1 -1 800  633.715 123.046 32.9876 7.21947 2.13113 0.598991 0.302549
2000  10 2  0 0 1 -1 -1 800  643.123 121.9 25.3014 7.11499 1.72914 0.544879 0.286285
2001  10 2  0 0 1 -1 -1 800  635.546 130.61 25.5393 5.74086 2.56436 0 0
2002  10 2  0 0 1 -1 -1 800  623.976 137.621 29.857 6.1959 1.55248 0.797671 0
2003  10 2  0 0 1 -1 -1 800  625.322 133.544 31.4497 7.28183 1.67316 0.728641 0
2004  10 2  0 0 1 -1 -1 800  652.659 112.573 25.9518 6.52497 2.29065 0 0
2005  10 2  0 0 1 -1 -1 800  585.835 171.291 31.9442 7.88702 2.18065 0.861885 0
2006  10 2  0 0 1 -1 -1 800  621.646 127.192 40.0323 8.00859 3.12195 0 0
2007  10 2  0 0 1 -1 -1 800  617.134 138.323 30.8984 10.374 3.27014 0 0
2008  10 2  0 0 1 -1 -1 800  629.863 127.089 31.7623 7.56111 3.72482 0 0
2009  10 2  0 0 1 -1 -1 800  611.309 144.354 32.2111 8.66047 2.24015 0.852433 0.372187
2010  10 2  0 0 1 -1 -1 800  595.491 152.998 38.231 9.26305 2.76024 1.25598 0
2011  10 2  0 0 1 -1 -1 800  576.595 161.941 44.7822 11.909 3.18414 1.005 0.582912
2012  10 2  0 0 1 -1 -1 800  598.716 140.201 43.0073 12.6905 3.69549 1.04038 0.648964
1985  4 3  0 0 1 -1 -1 800  635.021 126.072 28.4229 10.4837 0 0 0
1986  4 3  0 0 1 -1 -1 800  595.476 159.62 35.6468 6.33749 1.90868 1.01095 0
1987  4 3  0 0 1 -1 -1 800  653.364 105.711 32.119 6.73647 1.31578 0.753101 0
1988  4 3  0 0 1 -1 -1 800  700.043 80.5664 14.2697 3.84181 0.91105 0.368434 0
1989  4 3  0 0 1 -1 -1 800  630.427 147.194 18.4779 2.69541 1.20517 0 0
1990  4 3  0 0 1 -1 -1 800  605.485 149.997 39.2982 5.21966 0 0 0
1991  4 3  0 0 1 -1 -1 800  569.927 169.219 47.82 13.033 0 0 0
1992  4 3  0 0 1 -1 -1 800  633.12 114.429 39.2637 10.0848 3.10237 0 0
1993  4 3  0 0 1 -1 -1 800  632.207 128.73 27.0569 8.7167 3.28903 0 0
1994  4 3  0 0 1 -1 -1 800  655.486 110.433 26.2927 5.19042 2.59756 0 0
1995  4 3  0 0 1 -1 -1 800  651.404 118.738 22.8388 5.22597 1.12422 0.66878 0
1996  4 3  0 0 1 -1 -1 800  624.299 139.616 29.3091 4.97122 1.80543 0 0
1997  4 3  0 0 1 -1 -1 800  627.166 130.848 33.526 6.67224 1.23449 0.343272 0.20939
1998  4 3  0 0 1 -1 -1 800  602.173 151.792 35.3929 8.20891 2.43345 0 0
1999  4 3  0 0 1 -1 -1 800  641.505 116.285 33.2069 6.63818 1.72304 0.6423 0
2000  4 3  0 0 1 -1 -1 800  652.724 114.672 24.3191 6.32113 1.37542 0.588702 0
2001  4 3  0 0 1 -1 -1 800  644.244 123.271 25.2808 5.21365 1.99038 0 0
2002  4 3  0 0 1 -1 -1 800  633.826 129.777 29.0351 7.36209 0 0 0
2003  4 3  0 0 1 -1 -1 800  635.457 125.841 30.3602 8.34185 0 0 0
2004  4 3  0 0 1 -1 -1 800  661.922 105.743 24.8019 5.77084 1.76288 0 0
2005  4 3  0 0 1 -1 -1 800  598.004 161.922 30.7025 7.01652 2.35521 0 0
2006  4 3  0 0 1 -1 -1 800  632.169 119.844 38.4656 7.11666 1.73466 0.670432 0
2007  4 3  0 0 1 -1 -1 800  628.6 130.327 29.4048 9.15533 1.80517 0.707146 0
2008  4 3  0 0 1 -1 -1 800  641.38 119.427 29.7427 6.59131 2.17176 0.457791 0.229841
2009  4 3  0 0 1 -1 -1 800  623.339 135.986 30.4273 7.60223 2.646 0 0
2010  4 3  0 0 1 -1 -1 800  606.54 144.697 37.3246 8.33452 3.10436 0 0
2011  4 3  0 0 1 -1 -1 800  589.195 153.304 43.1978 10.6264 3.67662 0 0
2012  4 3  0 0 1 -1 -1 800  611.234 132.394 41.0109 11.223 2.94105 1.19737 0
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

