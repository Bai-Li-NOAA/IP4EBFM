#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Mon Sep 05 12:52:02 2022
#_expected_values
#C data file for simple example
#V3.30.19.01;_safe;_compile_date:_Apr 15 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
1985 #_StartYr
2012 #_EndYr
1 #_Nseas
 12 #_months/season
2 #_Nsubseasons (even number, minimum is 2)
1 #_spawn_month
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
-999 1 1 122818 0.05
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
1990 10 2 1.20005e+06 0.74 #_orig_obs: 2.17248e+06 survey1
1991 10 2 860024 0.75 #_orig_obs: 457211 survey1
1992 10 2 854184 0.76 #_orig_obs: 654267 survey1
1993 10 2 842209 0.73 #_orig_obs: 2.742e+06 survey1
1994 10 2 965550 0.77 #_orig_obs: 1.24859e+06 survey1
1995 10 2 1.06178e+06 0.74 #_orig_obs: 765889 survey1
1996 10 2 999705 0.58 #_orig_obs: 1.06592e+06 survey1
1997 10 2 948844 0.59 #_orig_obs: 798920 survey1
1998 10 2 778275 0.88 #_orig_obs: 467336 survey1
1999 10 2 805897 0.61 #_orig_obs: 762429 survey1
2000 10 2 908875 0.66 #_orig_obs: 1.26881e+06 survey1
2001 10 2 964907 0.83 #_orig_obs: 181093 survey1
2002 10 2 965179 0.59 #_orig_obs: 2.26419e+06 survey1
2003 10 2 978747 0.68 #_orig_obs: 433759 survey1
2004 10 2 1.18361e+06 0.73 #_orig_obs: 655693 survey1
2005 10 2 981324 0.59 #_orig_obs: 1.34118e+06 survey1
2006 10 2 981791 0.67 #_orig_obs: 848202 survey1
2007 10 2 961274 0.59 #_orig_obs: 853227 survey1
2008 10 2 1.02161e+06 0.63 #_orig_obs: 1.12118e+06 survey1
2009 10 2 974078 0.61 #_orig_obs: 1.08938e+06 survey1
2010 10 2 843334 0.8 #_orig_obs: 704446 survey1
2011 10 2 673775 0.65 #_orig_obs: 1.47644e+06 survey1
2012 10 2 603095 0.59 #_orig_obs: 472946 survey1
1985 4 3 2.15933e+06 1.15 #_orig_obs: 1.24882e+06 survey2
1986 4 3 1.7139e+06 1.14 #_orig_obs: 1.99917e+06 survey2
1987 4 3 1.92056e+06 1.18 #_orig_obs: 1.57746e+06 survey2
1988 4 3 3.105e+06 1.14 #_orig_obs: 1.6475e+06 survey2
1989 4 3 2.94901e+06 1.18 #_orig_obs: 1.23925e+06 survey2
1990 4 3 2.4784e+06 1.15 #_orig_obs: 3.96243e+06 survey2
1991 4 3 1.77061e+06 1.16 #_orig_obs: 1.23766e+06 survey2
1992 4 3 1.76254e+06 1.16 #_orig_obs: 4.05255e+06 survey2
1993 4 3 1.73587e+06 1.19 #_orig_obs: 2.78881e+06 survey2
1994 4 3 1.99288e+06 1.14 #_orig_obs: 2.0545e+06 survey2
1995 4 3 2.19976e+06 1.13 #_orig_obs: 489338 survey2
1996 4 3 2.05923e+06 1.2 #_orig_obs: 2.63447e+06 survey2
1997 4 3 1.96219e+06 1.22 #_orig_obs: 2.0764e+06 survey2
1998 4 3 1.61181e+06 0.4 #_orig_obs: 1.79828e+06 survey2
1999 4 3 1.66672e+06 0.43 #_orig_obs: 1.68709e+06 survey2
2000 4 3 1.87356e+06 0.36 #_orig_obs: 2.76477e+06 survey2
2001 4 3 1.99191e+06 0.38 #_orig_obs: 3.00164e+06 survey2
2002 4 3 1.98794e+06 0.43 #_orig_obs: 1.72283e+06 survey2
2003 4 3 2.01499e+06 0.36 #_orig_obs: 1.02429e+06 survey2
2004 4 3 2.44141e+06 0.38 #_orig_obs: 1.11484e+06 survey2
2005 4 3 2.01077e+06 0.39 #_orig_obs: 1.45828e+06 survey2
2006 4 3 2.01975e+06 0.42 #_orig_obs: 1.1028e+06 survey2
2007 4 3 1.97406e+06 0.42 #_orig_obs: 2.63809e+06 survey2
2008 4 3 2.09816e+06 0.45 #_orig_obs: 3.14237e+06 survey2
2009 4 3 1.99782e+06 0.41 #_orig_obs: 1.21002e+06 survey2
2010 4 3 1.73214e+06 0.39 #_orig_obs: 2.20188e+06 survey2
2011 4 3 1.37926e+06 0.38 #_orig_obs: 3.28081e+06 survey2
2012 4 3 1.23566e+06 0.44 #_orig_obs: 2.47554e+06 survey2
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
1985  1 1  0 0 1 -1 -1 800  60.6224 233.557 373.051 102.321 22.7123 5.28171 2.45485
1986  1 1  0 0 1 -1 -1 800  47.4881 249.001 406.329 72.7062 17.3453 7.13088 0
1987  1 1  0 0 1 -1 -1 800  62.0574 195.839 430.008 91.9981 13.9142 3.83439 2.34913
1988  1 1  0 0 1 -1 -1 800  114.263 254.154 321.988 88.1113 16.4425 2.97054 2.07059
1989  1 1  0 0 1 -1 -1 800  76.9001 347.765 313.553 46.7203 11.2379 2.5516 1.27218
1990  1 1  0 0 1 -1 -1 800  49.3719 238.382 453.888 49.316 6.30811 2.73406 0
1991  1 1  0 0 1 -1 -1 800  36.463 211.436 435.01 105.092 9.63675 2.36201 0
1992  1 1  0 0 1 -1 -1 800  49.1412 173.664 436.636 114.114 23.0697 2.44406 0.930759
1993  1 1  0 0 1 -1 -1 800  58.5376 232.694 358.75 117.453 25.4739 7.09192 0
1994  1 1  0 0 1 -1 -1 800  68.7384 226.26 396.603 79.658 21.5305 7.20984 0
1995  1 1  0 0 1 -1 -1 800  73.1462 259.333 362.037 84.7905 14.2484 6.44487 0
1996  1 1  0 0 1 -1 -1 800  59.0048 257.349 396.913 68.797 13.5275 4.40821 0
1997  1 1  0 0 1 -1 -1 800  55.1652 224.631 418.261 85.3906 12.368 4.1846 0
1998  1 1  0 0 1 -1 -1 800  48.3259 237.438 398.846 94.6077 16.5436 4.23803 0
1999  1 1  0 0 1 -1 -1 800  57.992 205.059 427.334 86.9287 17.6211 5.06546 0
2000  1 1  0 0 1 -1 -1 800  69.2618 237.558 372.595 98.5608 16.5972 5.42715 0
2001  1 1  0 0 1 -1 -1 800  67.5129 251.68 378.644 79.9657 17.384 3.29573 1.51777
2002  1 1  0 0 1 -1 -1 800  60.7541 242.587 400.014 78.2901 13.6328 3.37062 1.35173
2003  1 1  0 0 1 -1 -1 800  59.0054 227.849 405.955 88.8334 18.357 0 0
2004  1 1  0 0 1 -1 -1 800  72.1271 224.565 389.839 92.747 16.513 4.20915 0
2005  1 1  0 0 1 -1 -1 800  50.4683 266.61 374.03 87.4596 16.8766 4.55631 0
2006  1 1  0 0 1 -1 -1 800  51.4277 190.306 451.663 85.5656 16.2442 4.79329 0
2007  1 1  0 0 1 -1 -1 800  55.5279 224.709 376.196 119.71 18.3777 5.47968 0
2008  1 1  0 0 1 -1 -1 800  59.7206 217.073 402.978 91.2765 23.3358 5.61618 0
2009  1 1  0 0 1 -1 -1 800  54.7639 233.158 388.021 99.2789 18.0122 6.76571 0
2010  1 1  0 0 1 -1 -1 800  46.8846 218.051 414.451 94.9308 19.6991 5.98381 0
2011  1 1  0 0 1 -1 -1 800  40.0024 203.198 423.512 106.635 19.9335 6.719 0
2012  1 1  0 0 1 -1 -1 800  43.451 183.906 422.757 118.316 24.1294 5.03031 2.41148
1990  10 2  0 0 1 -1 -1 800  597.333 158.386 38.42 4.47073 1.39032 0 0
1991  10 2  0 0 1 -1 -1 800  560.163 178.529 46.9331 12.1318 2.2432 0 0
1992  10 2  0 0 1 -1 -1 800  623.927 121.488 39.6144 11.0259 3.94423 0 0
1993  10 2  0 0 1 -1 -1 800  622.543 136.411 27.3214 9.52104 4.20296 0 0
1994  10 2  0 0 1 -1 -1 800  646.426 117.465 26.9914 5.75417 3.3636 0 0
1995  10 2  0 0 1 -1 -1 800  644.706 125.343 22.0806 5.55513 1.37271 0.584391 0.358032
1996  10 2  0 0 1 -1 -1 800  614.564 147.846 29.7613 5.48283 1.56215 0.783706 0
1997  10 2  0 0 1 -1 -1 800  619.298 138.45 32.7749 9.47711 0 0 0
1998  10 2  0 0 1 -1 -1 800  595.185 159.905 33.2988 8.53246 2.21105 0.520358 0.348016
1999  10 2  0 0 1 -1 -1 800  633.701 123.217 32.8984 7.15448 2.11849 0.60355 0.30706
2000  10 2  0 0 1 -1 -1 800  643.111 121.955 25.2972 7.08308 1.71838 0.545384 0.290378
2001  10 2  0 0 1 -1 -1 800  635.603 130.583 25.5127 5.73578 2.56547 0 0
2002  10 2  0 0 1 -1 -1 800  624 137.613 29.8354 6.19215 1.55737 0.802885 0
2003  10 2  0 0 1 -1 -1 800  625.384 133.506 31.4152 7.27961 1.67918 0.735984 0
2004  10 2  0 0 1 -1 -1 800  652.838 112.43 25.9122 6.51749 2.30234 0 0
2005  10 2  0 0 1 -1 -1 800  585.858 171.261 31.9296 7.89083 2.18901 0.87171 0
2006  10 2  0 0 1 -1 -1 800  621.622 127.213 40.0015 8.0168 3.14679 0 0
2007  10 2  0 0 1 -1 -1 800  617.142 138.296 30.8886 10.3756 3.29755 0 0
2008  10 2  0 0 1 -1 -1 800  629.905 126.997 31.7716 7.57281 3.75307 0 0
2009  10 2  0 0 1 -1 -1 800  611.343 144.256 32.2182 8.68567 2.25581 0.863273 0.378817
2010  10 2  0 0 1 -1 -1 800  595.524 152.933 38.2045 9.28062 2.78199 1.27605 0
2011  10 2  0 0 1 -1 -1 800  576.516 161.975 44.7672 11.921 3.20663 1.02092 0.594027
2012  10 2  0 0 1 -1 -1 800  598.517 140.301 43.03 12.7121 3.72064 1.05682 0.662813
1985  4 3  0 0 1 -1 -1 800  634.842 126.123 28.405 10.6302 0 0 0
1986  4 3  0 0 1 -1 -1 800  595.106 160.036 35.687 6.22908 1.90342 1.03894 0
1987  4 3  0 0 1 -1 -1 800  653.036 105.978 32.2196 6.70938 1.29252 0.764947 0
1988  4 3  0 0 1 -1 -1 800  700.483 80.2388 14.232 3.78438 0.895305 0.36625 0
1989  4 3  0 0 1 -1 -1 800  630.982 146.764 18.4056 2.6675 1.18139 0 0
1990  4 3  0 0 1 -1 -1 800  605.455 150.031 39.2848 5.22891 0 0 0
1991  4 3  0 0 1 -1 -1 800  569.541 169.516 47.9075 13.0354 0 0 0
1992  4 3  0 0 1 -1 -1 800  632.828 114.665 39.3703 10.0382 3.0988 0 0
1993  4 3  0 0 1 -1 -1 800  632.126 128.84 27.1074 8.65926 3.26785 0 0
1994  4 3  0 0 1 -1 -1 800  655.379 110.534 26.3432 5.16601 2.57849 0 0
1995  4 3  0 0 1 -1 -1 800  651.501 118.642 22.8595 5.21371 1.11747 0.665964 0
1996  4 3  0 0 1 -1 -1 800  624.365 139.558 29.3181 4.96 1.79884 0 0
1997  4 3  0 0 1 -1 -1 800  626.908 131.042 33.5814 6.67959 1.23546 0.344075 0.209163
1998  4 3  0 0 1 -1 -1 800  601.813 152.076 35.485 8.18852 2.43684 0 0
1999  4 3  0 0 1 -1 -1 800  641.373 116.389 33.2832 6.59974 1.71052 0.644303 0
2000  4 3  0 0 1 -1 -1 800  652.757 114.641 24.3567 6.29499 1.36289 0.587455 0
2001  4 3  0 0 1 -1 -1 800  644.368 123.15 25.2879 5.21073 1.98291 0 0
2002  4 3  0 0 1 -1 -1 800  633.945 129.665 29.0344 7.35645 0 0 0
2003  4 3  0 0 1 -1 -1 800  635.596 125.706 30.3568 8.34066 0 0 0
2004  4 3  0 0 1 -1 -1 800  662.188 105.517 24.772 5.75995 1.7636 0 0
2005  4 3  0 0 1 -1 -1 800  598.195 161.759 30.6769 7.01115 2.35783 0 0
2006  4 3  0 0 1 -1 -1 800  632.216 119.771 38.4765 7.12279 1.73909 0.674149 0
2007  4 3  0 0 1 -1 -1 800  628.709 130.201 29.4163 9.15203 1.80929 0.712006 0
2008  4 3  0 0 1 -1 -1 800  641.564 119.238 29.7395 6.59171 2.17428 0.460658 0.231592
2009  4 3  0 0 1 -1 -1 800  623.542 135.775 30.4138 7.61209 2.65707 0 0
2010  4 3  0 0 1 -1 -1 800  606.709 144.518 37.307 8.34491 3.12175 0 0
2011  4 3  0 0 1 -1 -1 800  589.241 153.221 43.2096 10.6319 3.69673 0 0
2012  4 3  0 0 1 -1 -1 800  611.139 132.392 41.0702 11.2381 2.95138 1.20943 0
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

