// Create a file with an R object from AD Model Builder

// open the file using the default AD Model Builder file name, and
// 6 digits of precision
open_r_file(adprogram_name + ".rdat", 6);

// Example of an INFO object
open_r_info_list("info", true);
	wrt_r_item("title", "SEDAR ## Assessment");
	wrt_r_item("species", "Atlantic menhaden");
	wrt_r_item("model", "Statistical Catch at Age");
	if(SR_switch==1)
	    {wrt_r_item("rec.model", "BH-steep");}
        if(SR_switch==2)
	    {wrt_r_item("rec.model", "Ricker-steep");}
	wrt_r_item("base.run", "am001.tpl");
	wrt_r_item("units.length", "mm");
	wrt_r_item("units.weight", "1000s mt");
	wrt_r_item("units.biomass", "1000s mt");
	wrt_r_item("units.ssb", "billions of eggs");
	wrt_r_item("units.ypr", "1000s mt");
	wrt_r_item("units.landings", "1000s mt");
	wrt_r_item("units.numbers", "billion fish");
        wrt_r_item("units.naa", "billion fish");
	wrt_r_item("units.rec", "billion fish");
close_r_info_list();


// VECTOR object of parameters and estimated quantities
open_r_info_list("parms", false);
	wrt_r_item("styr", styr);
	wrt_r_item("endyr", endyr);
	wrt_r_item("styrR", styr_rec_dev);
	wrt_r_item("Linf", Linf);
	wrt_r_item("K", K);
	wrt_r_item("t0", t0);
	wrt_r_item("len_cv_nad_val",len_cv_nad_val);
	wrt_r_item("len_cv_mad_val",len_cv_mad_val);
	//wrt_r_item("len_cv_sad_val",len_cv_sad_val);
	wrt_r_item("wgt.a", wgtpar_a);
	wrt_r_item("wgt.b", wgtpar_b);
        wrt_r_item("spawn.time", spawn_time_frac);
	wrt_r_item("q.nad", mfexp(log_q_nad));
        wrt_r_item("q.mad", mfexp(log_q_mad));
        wrt_r_item("q.sad", mfexp(log_q_sad));
	wrt_r_item("q.jai", mfexp(log_q_jai));
        wrt_r_item("q2.jai", mfexp(log_q2_jai));
        wrt_r_item("q.mar", mfexp(log_q_mar));
        wrt_r_item("q.eco", mfexp(log_q_eco));
	
        wrt_r_item("q.rate",q_rate);
	wrt_r_item("q.beta",q_DD_beta);
	wrt_r_item("q.DD.B0.exploitable", B0_q_DD);
	
        wrt_r_item("F.prop.cRn", F_cRn_prop);
        wrt_r_item("F.prop.cRs", F_cRs_prop);
        wrt_r_item("F.prop.cBn", F_cBn_prop);
        wrt_r_item("F.prop.cBs", F_cBs_prop);
	wrt_r_item("Fend.mean", Fend_mean);

	wrt_r_item("B0", B0);
	wrt_r_item("Bstyr.B0", totB(styr)/B0);
	wrt_r_item("SSB0", S0);
	wrt_r_item("SSBstyr.SSB0", SSB(styr)/S0);
	wrt_r_item("Rstyr.R0", rec(styr)/R0);
	if(SR_switch==1)
	{
          wrt_r_item("BH.biascorr",BiasCor);
	  wrt_r_item("BH.Phi0", spr_F0);
	  wrt_r_item("BH.R0", R0);
	  wrt_r_item("BH.steep", steep);
         }
        if(SR_switch==2)
	{
          wrt_r_item("Ricker.biascorr",BiasCor);
	  wrt_r_item("Ricker.Phi0", spr_F0);
	  wrt_r_item("Ricker.R0", R0);
	  wrt_r_item("Ricker.steep", steep);
         }
	wrt_r_item("R.sigma.logdevs", sigma_rec_dev);
	wrt_r_item("R.sigma.par",rec_sigma);
	wrt_r_item("R.autocorr",R_autocorr);
	wrt_r_item("R0", R0); //same as BH.R0, but used in BSR.time.plots
	wrt_r_item("R.virgin.bc", R_virgin); //bias-corrected virgin recruitment
	wrt_r_item("rec.lag", 1.0);
	wrt_r_item("msy.mt", msy_mt_out);
	//wrt_r_item("msy.knum", msy_knum_out);
	wrt_r_item("Fmsy", F_msy_out);
	wrt_r_item("SSBmsy", SSB_msy_out);
	wrt_r_item("Bmsy", B_msy_out);
	wrt_r_item("Rmsy", R_msy_out);
	wrt_r_item("sprmsy",spr_msy_out);
	wrt_r_item("Fend.Fmsy", FdF_msy_end);
	wrt_r_item("Fend.Fmsy.mean", FdF_msy_end_mean);
	wrt_r_item("SSBend.SSBmsy", SdSSB_msy_end);
	wrt_r_item("F30", F30_out); //For FishGraph
	wrt_r_item("SSB.F30", SSB_F30_out); //For FishGraph
	wrt_r_item("B.F30", B_F30_out);
	wrt_r_item("R.F30", R_F30_out);
        wrt_r_item("L.F30.knum", L_F30_knum_out);
        wrt_r_item("L.F30.mt", L_F30_mt_out);
 close_r_info_list();
	
 // VECTOR object of parameters and estimated quantities
open_r_info_list("spr.brps", false);
	wrt_r_item("F35", F35_out);
	wrt_r_item("F30", F30_out);
	wrt_r_item("F40", F40_out);
	wrt_r_item("SSB.F30", SSB_F30_out);
        wrt_r_item("B.F30", B_F30_out);
	wrt_r_item("R.F30", R_F30_out);
        wrt_r_item("L.F30.knum", L_F30_knum_out);
        wrt_r_item("L.F30.mt", L_F30_mt_out);
    	wrt_r_item("Fend.F30.mean", FdF30_end_mean);
        wrt_r_item("SSBend.SSBF30", SdSSB_F30_end);
close_r_info_list();

// MATRIX object of parameter constraints
open_r_df("parm.cons",1,8,2);
    wrt_r_namevector(1,8);
    wrt_r_df_col("Linf",Linf_out);
    wrt_r_df_col("K",K_out);
    wrt_r_df_col("t0",t0_out);
    wrt_r_df_col("len_cv_nad_val",len_cv_nad_val_out);
    wrt_r_df_col("len_cv_mad_val",len_cv_mad_val_out);
    //wrt_r_df_col("len_cv_sad_val",len_cv_sad_val_out);
    wrt_r_df_col("log_R0",log_R0_out);
    wrt_r_df_col("steep",steep_out);
    wrt_r_df_col("rec_sigma",rec_sigma_out);
    wrt_r_df_col("R_autocorr",R_autocorr_out);
    wrt_r_df_col("log_dm_nad_lc",log_dm_nad_lc_out);
    wrt_r_df_col("log_dm_mad_lc",log_dm_mad_lc_out);
    //wrt_r_df_col("log_dm_sad_lc",log_dm_sad_lc_out);   
    wrt_r_df_col("log_dm_cRn_ac",log_dm_cRn_ac_out);
    wrt_r_df_col("log_dm_cRs_ac",log_dm_cRs_ac_out);
    wrt_r_df_col("log_dm_cBn_ac",log_dm_cBn_ac_out);
    wrt_r_df_col("log_dm_cBs_ac",log_dm_cBs_ac_out);
		
    wrt_r_df_col("selpar_A50_cRn",selpar_A50_cRn_out);
    wrt_r_df_col("selpar_slope_cRn",selpar_slope_cRn_out);
    wrt_r_df_col("selpar_A502_cRn",selpar_A502_cRn_out);
    wrt_r_df_col("selpar_slope2_cRn",selpar_slope2_cRn_out);	

    wrt_r_df_col("selpar_A50_cRn2",selpar_A50_cRn2_out);
    wrt_r_df_col("selpar_slope_cRn2",selpar_slope_cRn2_out);
    wrt_r_df_col("selpar_A502_cRn2",selpar_A502_cRn2_out);
    wrt_r_df_col("selpar_slope2_cRn2",selpar_slope2_cRn2_out);

    wrt_r_df_col("selpar_A50_cRn3",selpar_A50_cRn3_out);
    wrt_r_df_col("selpar_slope_cRn3",selpar_slope_cRn3_out);
    wrt_r_df_col("selpar_A502_cRn3",selpar_A502_cRn3_out);
    wrt_r_df_col("selpar_slope2_cRn3",selpar_slope2_cRn3_out);

    wrt_r_df_col("selpar_A50_cRn4",selpar_A50_cRn4_out);
    wrt_r_df_col("selpar_slope_cRn4",selpar_slope_cRn4_out);
    wrt_r_df_col("selpar_A502_cRn4",selpar_A502_cRn4_out);
    wrt_r_df_col("selpar_slope2_cRn4",selpar_slope2_cRn4_out);

    wrt_r_df_col("selpar_A50_cRs",selpar_A50_cRs_out);
    wrt_r_df_col("selpar_slope_cRs",selpar_slope_cRs_out);
    wrt_r_df_col("selpar_A502_cRs",selpar_A502_cRs_out);
    wrt_r_df_col("selpar_slope2_cRs",selpar_slope2_cRs_out);

    wrt_r_df_col("selpar_A50_cRs2",selpar_A50_cRs2_out);
    wrt_r_df_col("selpar_slope_cRs2",selpar_slope_cRs2_out);
    wrt_r_df_col("selpar_A502_cRs2",selpar_A502_cRs2_out);
    wrt_r_df_col("selpar_slope2_cRs2",selpar_slope2_cRs2_out);

    wrt_r_df_col("selpar_A50_cRs3",selpar_A50_cRs3_out);
    wrt_r_df_col("selpar_slope_cRs3",selpar_slope_cRs3_out);
    wrt_r_df_col("selpar_A502_cRs3",selpar_A502_cRs3_out);
    wrt_r_df_col("selpar_slope2_cRs3",selpar_slope2_cRs3_out);

    wrt_r_df_col("selpar_A50_cRs4",selpar_A50_cRs4_out);
    wrt_r_df_col("selpar_slope_cRs4",selpar_slope_cRs4_out);
    wrt_r_df_col("selpar_A502_cRs4",selpar_A502_cRs4_out);
    wrt_r_df_col("selpar_slope2_cRs4",selpar_slope2_cRs4_out);

    wrt_r_df_col("selpar_A50_cBn",selpar_A50_cBn_out);
    wrt_r_df_col("selpar_slope_cBn",selpar_slope_cBn_out);
    wrt_r_df_col("selpar_A502_cBn",selpar_A502_cBn_out);
    wrt_r_df_col("selpar_slope2_cBn",selpar_slope2_cBn_out);
	
    wrt_r_df_col("selpar_A50_cBn2",selpar_A50_cBn2_out);
    wrt_r_df_col("selpar_slope_cBn2",selpar_slope_cBn2_out);
    wrt_r_df_col("selpar_A502_cBn2",selpar_A502_cBn2_out);
    wrt_r_df_col("selpar_slope2_cBn2",selpar_slope2_cBn2_out);

    wrt_r_df_col("selpar_A50_cBs",selpar_A50_cBs_out);
    wrt_r_df_col("selpar_slope_cBs",selpar_slope_cBs_out);
    wrt_r_df_col("selpar_A502_cBs",selpar_A502_cBs_out);
    wrt_r_df_col("selpar_slope2_cBs",selpar_slope2_cBs_out);

    wrt_r_df_col("selpar_A50_cBs2",selpar_A50_cBs2_out);
    wrt_r_df_col("selpar_slope_cBs2",selpar_slope_cBs2_out);
    wrt_r_df_col("selpar_A502_cBs2",selpar_A502_cBs2_out);
    wrt_r_df_col("selpar_slope2_cBs2",selpar_slope2_cBs2_out);

    wrt_r_df_col("selpar_age0_cRn_logit",selpar_age0_cRn_out);
    wrt_r_df_col("selpar_age1_cRn_logit",selpar_age1_cRn_out);
    wrt_r_df_col("selpar_age2_cRn_logit",selpar_age2_cRn_out);
    wrt_r_df_col("selpar_age3_cRn_logit",selpar_age3_cRn_out);
    wrt_r_df_col("selpar_age4_cRn_logit",selpar_age4_cRn_out);
    wrt_r_df_col("selpar_age5_cRn_logit",selpar_age5_cRn_out);
    wrt_r_df_col("selpar_age6_cRn_logit",selpar_age6_cRn_out);

    wrt_r_df_col("selpar_age0_cRn2_logit",selpar_age0_cRn2_out);
    wrt_r_df_col("selpar_age1_cRn2_logit",selpar_age1_cRn2_out);
    wrt_r_df_col("selpar_age2_cRn2_logit",selpar_age2_cRn2_out);
    wrt_r_df_col("selpar_age3_cRn2_logit",selpar_age3_cRn2_out);
    wrt_r_df_col("selpar_age4_cRn2_logit",selpar_age4_cRn2_out);
    wrt_r_df_col("selpar_age5_cRn2_logit",selpar_age5_cRn2_out);
    wrt_r_df_col("selpar_age6_cRn2_logit",selpar_age6_cRn2_out);

    wrt_r_df_col("selpar_age0_cRn3_logit",selpar_age0_cRn3_out);
    wrt_r_df_col("selpar_age1_cRn3_logit",selpar_age1_cRn3_out);
    wrt_r_df_col("selpar_age2_cRn3_logit",selpar_age2_cRn3_out);
    wrt_r_df_col("selpar_age3_cRn3_logit",selpar_age3_cRn3_out);
    wrt_r_df_col("selpar_age4_cRn3_logit",selpar_age4_cRn3_out);
    wrt_r_df_col("selpar_age5_cRn3_logit",selpar_age5_cRn3_out);
    wrt_r_df_col("selpar_age6_cRn3_logit",selpar_age6_cRn3_out);

    wrt_r_df_col("selpar_age0_cRn4_logit",selpar_age0_cRn4_out);
    wrt_r_df_col("selpar_age1_cRn4_logit",selpar_age1_cRn4_out);
    wrt_r_df_col("selpar_age2_cRn4_logit",selpar_age2_cRn4_out);
    wrt_r_df_col("selpar_age3_cRn4_logit",selpar_age3_cRn4_out);
    wrt_r_df_col("selpar_age4_cRn4_logit",selpar_age4_cRn4_out);
    wrt_r_df_col("selpar_age5_cRn4_logit",selpar_age5_cRn4_out);
    wrt_r_df_col("selpar_age6_cRn4_logit",selpar_age6_cRn4_out);

    wrt_r_df_col("selpar_age0_cRs_logit",selpar_age0_cRs_out);
    wrt_r_df_col("selpar_age1_cRs_logit",selpar_age1_cRs_out);
    wrt_r_df_col("selpar_age2_cRs_logit",selpar_age2_cRs_out);
    wrt_r_df_col("selpar_age3_cRs_logit",selpar_age3_cRs_out);
    wrt_r_df_col("selpar_age4_cRs_logit",selpar_age4_cRs_out);
    wrt_r_df_col("selpar_age5_cRs_logit",selpar_age5_cRs_out);
    wrt_r_df_col("selpar_age6_cRs_logit",selpar_age6_cRs_out);
 
    wrt_r_df_col("selpar_age0_cRs2_logit",selpar_age0_cRs2_out);
    wrt_r_df_col("selpar_age1_cRs2_logit",selpar_age1_cRs2_out);
    wrt_r_df_col("selpar_age2_cRs2_logit",selpar_age2_cRs2_out);
    wrt_r_df_col("selpar_age3_cRs2_logit",selpar_age3_cRs2_out);
    wrt_r_df_col("selpar_age4_cRs2_logit",selpar_age4_cRs2_out);
    wrt_r_df_col("selpar_age5_cRs2_logit",selpar_age5_cRs2_out);
    wrt_r_df_col("selpar_age6_cRs2_logit",selpar_age6_cRs2_out);

    wrt_r_df_col("selpar_age0_cRs3_logit",selpar_age0_cRs3_out);
    wrt_r_df_col("selpar_age1_cRs3_logit",selpar_age1_cRs3_out);
    wrt_r_df_col("selpar_age2_cRs3_logit",selpar_age2_cRs3_out);
    wrt_r_df_col("selpar_age3_cRs3_logit",selpar_age3_cRs3_out);
    wrt_r_df_col("selpar_age4_cRs3_logit",selpar_age4_cRs3_out);
    wrt_r_df_col("selpar_age5_cRs3_logit",selpar_age5_cRs3_out);
    wrt_r_df_col("selpar_age6_cRs3_logit",selpar_age6_cRs3_out);

    wrt_r_df_col("selpar_age0_cRs4_logit",selpar_age0_cRs4_out);
    wrt_r_df_col("selpar_age1_cRs4_logit",selpar_age1_cRs4_out);
    wrt_r_df_col("selpar_age2_cRs4_logit",selpar_age2_cRs4_out);
    wrt_r_df_col("selpar_age3_cRs4_logit",selpar_age3_cRs4_out);
    wrt_r_df_col("selpar_age4_cRs4_logit",selpar_age4_cRs4_out);
    wrt_r_df_col("selpar_age5_cRs4_logit",selpar_age5_cRs4_out);
    wrt_r_df_col("selpar_age6_cRs4_logit",selpar_age6_cRs4_out);
    
    wrt_r_df_col("selpar_age0_cBn_logit",selpar_age0_cBn_out);
    wrt_r_df_col("selpar_age1_cBn_logit",selpar_age1_cBn_out);
    wrt_r_df_col("selpar_age2_cBn_logit",selpar_age2_cBn_out);
    wrt_r_df_col("selpar_age3_cBn_logit",selpar_age3_cBn_out);
    wrt_r_df_col("selpar_age4_cBn_logit",selpar_age4_cBn_out);
    wrt_r_df_col("selpar_age5_cBn_logit",selpar_age5_cBn_out);
    wrt_r_df_col("selpar_age6_cBn_logit",selpar_age6_cBn_out);

    wrt_r_df_col("selpar_age0_cBn2_logit",selpar_age0_cBn2_out);
    wrt_r_df_col("selpar_age1_cBn2_logit",selpar_age1_cBn2_out);
    wrt_r_df_col("selpar_age2_cBn2_logit",selpar_age2_cBn2_out);
    wrt_r_df_col("selpar_age3_cBn2_logit",selpar_age3_cBn2_out);
    wrt_r_df_col("selpar_age4_cBn2_logit",selpar_age4_cBn2_out);
    wrt_r_df_col("selpar_age5_cBn2_logit",selpar_age5_cBn2_out);
    wrt_r_df_col("selpar_age6_cBn2_logit",selpar_age6_cBn2_out);

    wrt_r_df_col("selpar_age0_cBs_logit",selpar_age0_cBs_out);
    wrt_r_df_col("selpar_age1_cBs_logit",selpar_age1_cBs_out);
    wrt_r_df_col("selpar_age2_cBs_logit",selpar_age2_cBs_out);
    wrt_r_df_col("selpar_age3_cBs_logit",selpar_age3_cBs_out);
    wrt_r_df_col("selpar_age4_cBs_logit",selpar_age4_cBs_out);
    wrt_r_df_col("selpar_age5_cBs_logit",selpar_age5_cBs_out);
    wrt_r_df_col("selpar_age6_cBs_logit",selpar_age6_cBs_out);

    wrt_r_df_col("selpar_age0_cBs2_logit",selpar_age0_cBs2_out);
    wrt_r_df_col("selpar_age1_cBs2_logit",selpar_age1_cBs2_out);
    wrt_r_df_col("selpar_age2_cBs2_logit",selpar_age2_cBs2_out);
    wrt_r_df_col("selpar_age3_cBs2_logit",selpar_age3_cBs2_out);
    wrt_r_df_col("selpar_age4_cBs2_logit",selpar_age4_cBs2_out);
    wrt_r_df_col("selpar_age5_cBs2_logit",selpar_age5_cBs2_out);
    wrt_r_df_col("selpar_age6_cBs2_logit",selpar_age6_cBs2_out);
    
    wrt_r_df_col("selpar_A50_nad",selpar_A50_nad_out);
    wrt_r_df_col("selpar_slope_nad",selpar_slope_nad_out);
    wrt_r_df_col("selpar_A502_nad",selpar_A502_nad_out);
    wrt_r_df_col("selpar_slope2_nad",selpar_slope2_nad_out);

    wrt_r_df_col("selpar_age0_nad_logit",selpar_age0_nad_out);
    wrt_r_df_col("selpar_age1_nad_logit",selpar_age1_nad_out);
    wrt_r_df_col("selpar_age2_nad_logit",selpar_age2_nad_out);
    wrt_r_df_col("selpar_age3_nad_logit",selpar_age3_nad_out);
    wrt_r_df_col("selpar_age4_nad_logit",selpar_age4_nad_out);
    wrt_r_df_col("selpar_age5_nad_logit",selpar_age5_nad_out);
    wrt_r_df_col("selpar_age6_nad_logit",selpar_age6_nad_out);

    wrt_r_df_col("selpar_A50_mad",selpar_A50_mad_out);
    wrt_r_df_col("selpar_slope_mad",selpar_slope_mad_out);
    wrt_r_df_col("selpar_A502_mad",selpar_A502_mad_out);
    wrt_r_df_col("selpar_slope2_mad",selpar_slope2_mad_out);

    wrt_r_df_col("selpar_age0_mad_logit",selpar_age0_mad_out);
    wrt_r_df_col("selpar_age1_mad_logit",selpar_age1_mad_out);
    wrt_r_df_col("selpar_age2_mad_logit",selpar_age2_mad_out);
    wrt_r_df_col("selpar_age3_mad_logit",selpar_age3_mad_out);
    wrt_r_df_col("selpar_age4_mad_logit",selpar_age4_mad_out);
    wrt_r_df_col("selpar_age5_mad_logit",selpar_age5_mad_out);
    wrt_r_df_col("selpar_age6_mad_logit",selpar_age6_mad_out);

    wrt_r_df_col("selpar_A50_sad",selpar_A50_sad_out);
    wrt_r_df_col("selpar_slope_sad",selpar_slope_sad_out);
    wrt_r_df_col("selpar_A502_sad",selpar_A502_sad_out);
    wrt_r_df_col("selpar_slope2_sad",selpar_slope2_sad_out);

    wrt_r_df_col("selpar_age0_sad_logit",selpar_age0_sad_out);
    wrt_r_df_col("selpar_age1_sad_logit",selpar_age1_sad_out);
    wrt_r_df_col("selpar_age2_sad_logit",selpar_age2_sad_out);
    wrt_r_df_col("selpar_age3_sad_logit",selpar_age3_sad_out);
    wrt_r_df_col("selpar_age4_sad_logit",selpar_age4_sad_out);
    wrt_r_df_col("selpar_age5_sad_logit",selpar_age5_sad_out);
    wrt_r_df_col("selpar_age6_sad_logit",selpar_age6_sad_out);

    wrt_r_df_col("log_q_nad",log_q_nad_out);
    wrt_r_df_col("log_q_mad",log_q_mad_out);
    wrt_r_df_col("log_q_sad",log_q_sad_out);
    wrt_r_df_col("log_q_jai",log_q_jai_out);
    wrt_r_df_col("log_q2_jai",log_q2_jai_out);
    wrt_r_df_col("log_q_mar",log_q_mar_out);
    wrt_r_df_col("log_q_eco",log_q_eco_out);
    
    wrt_r_df_col("log_avg_F_cRn",log_avg_F_cRn_out);
    wrt_r_df_col("log_avg_F_cRs",log_avg_F_cRs_out);
    wrt_r_df_col("log_avg_F_cBn",log_avg_F_cBn_out);
    wrt_r_df_col("log_avg_F_cBs",log_avg_F_cBs_out);
    
    //wrt_r_df_col("F_init",F_init_out);
close_r_df();

// DATA FRAME of time series deviation vector estimates
// names used in this object must match the names used in the "parm.tvec.cons" object
open_r_df("parm.tvec", styr, endyr, 2);
	wrt_r_namevector(styr,endyr);
	wrt_r_df_col("year", styr,endyr);
        wrt_r_df_col("log.rec.dev", log_rec_dev_out);
        wrt_r_df_col("log.F.dev.cRn", log_F_dev_cRn_out);
        wrt_r_df_col("log.F.dev.cRs", log_F_dev_cRs_out);
        wrt_r_df_col("log.F.dev.cBn", log_F_dev_cBn_out);
        wrt_r_df_col("log.F.dev.cBs", log_F_dev_cBs_out);
	wrt_r_df_col("log.q.dev.nad.RWq", q_RW_log_dev_nad);
	wrt_r_df_col("log.q.dev.mad.RWq", q_RW_log_dev_mad);
	wrt_r_df_col("log.q.dev.sad.RWq", q_RW_log_dev_sad);
	wrt_r_df_col("log.q.dev.jai.RWq", q_RW_log_dev_jai);
	
close_r_df();

// MATRIX object of deviation vector constraints
// names used in this object must match the names used in the "parm.tvec" object
open_r_df("parm.tvec.cons",1,3,2);
        wrt_r_namevector(1,3);
        wrt_r_df_col("log.rec.dev",set_log_rec_dev);
        wrt_r_df_col("log.F.dev.cRn",set_log_F_dev_cRn);	
        wrt_r_df_col("log.F.dev.cRs",set_log_F_dev_cRs);
        wrt_r_df_col("log.F.dev.cBn",set_log_F_dev_cBn);
        wrt_r_df_col("log.F.dev.cBs",set_log_F_dev_cBs);
	wrt_r_df_col("log.q.dev.nad.RWq", set_log_RWq_dev);
	wrt_r_df_col("log.q.dev.mad.RWq", set_log_RWq_dev);
	wrt_r_df_col("log.q.dev.sad.RWq", set_log_RWq_dev);
	wrt_r_df_col("log.q.dev.jai.RWq", set_log_RWq_dev);
close_r_df();

// DATA FRAME of age vector deviation estimates
// names used in this object must match the names used in the "parm.avec.cons" object
open_r_df("parm.avec", 1, nages, 2);
	wrt_r_namevector(1,nages);
	wrt_r_df_col("age", agebins); //deviations for first age not estimated
        wrt_r_df_col("log.Nage.dev", log_Nage_dev_output);
close_r_df();

// MATRIX object of age vector deviation constraints
// names used in this object must match the names used in the "parm.avec" object
open_r_df("parm.avec.cons",1,3,2);
    wrt_r_namevector(1,3);
    wrt_r_df_col("log.Nage.dev",set_log_Nage_dev);
close_r_df();

// VECTOR object of SDNR calculations
open_r_vector("sdnr");
    wrt_r_item("sdnr.U.nad", sdnr_I_nad);
    wrt_r_item("sdnr.U.mad", sdnr_I_mad);
    wrt_r_item("sdnr.U.sad", sdnr_I_sad);
    wrt_r_item("sdnr.U.jai", sdnr_I_jai);
    wrt_r_item("sdnr.U.mareco", sdnr_I_mareco);
    	
    wrt_r_item("sdnr.lc.nad", sdnr_lc_nad);
    wrt_r_item("sdnr.lc.mad", sdnr_lc_mad);
    //wrt_r_item("sdnr.lc.sad", sdnr_lc_sad);
    	
    wrt_r_item("sdnr.ac.cRn", sdnr_ac_cRn);
    wrt_r_item("sdnr.ac.cRs", sdnr_ac_cRs);
    wrt_r_item("sdnr.ac.cBn", sdnr_ac_cBn);
    wrt_r_item("sdnr.ac.cBs", sdnr_ac_cBs);    	
close_r_vector();

// VECTOR object of likelihood contributions
open_r_vector("like");
    wrt_r_item("lk.total", fval); //weighted likelihood
    wrt_r_item("lk.unwgt.data", fval_data);  //likelihood of just data components

    wrt_r_item("lk.L.cRn", f_cRn_L);
    wrt_r_item("lk.L.cRs", f_cRs_L);
    wrt_r_item("lk.L.cBn", f_cBn_L);
    wrt_r_item("lk.L.cBs", f_cBs_L);
    
    wrt_r_item("lk.U.nad", f_nad_cpue);
    wrt_r_item("lk.U.mad", f_mad_cpue);
    wrt_r_item("lk.U.sad", f_sad_cpue);
    wrt_r_item("lk.U.jai", f_jai_cpue);
    wrt_r_item("lk.U.mareco", f_mareco_cpue);
    
    wrt_r_item("lk.lenc.nad", f_nad_lenc);
    wrt_r_item("lk.lenc.mad", f_mad_lenc);
    //wrt_r_item("lk.lenc.sad", f_sad_lenc);
    
    wrt_r_item("lk.agec.cRn", f_cRn_agec);
    wrt_r_item("lk.agec.cRs", f_cRs_agec);
    wrt_r_item("lk.agec.cBn", f_cBn_agec);
    wrt_r_item("lk.agec.cBs", f_cBs_agec);
    
    wrt_r_item("lk.Nage.init", f_Nage_init);
    wrt_r_item("lk.SRfit", f_rec_dev);
    wrt_r_item("lk.SRearly", f_rec_dev_early);
    wrt_r_item("lk.SRend", f_rec_dev_end);
    wrt_r_item("lk.fullF", f_fullF_constraint);
    wrt_r_item("lk.Ftune", f_Ftune);
    wrt_r_item("lk.priors",f_priors);
    wrt_r_item("gradient.max",grad_max);

    wrt_r_item("w.L", w_L);
    
    wrt_r_item("w.U.nad", w_I_nad);
    wrt_r_item("w.U.mad", w_I_mad);
    wrt_r_item("w.U.sad", w_I_sad);
    wrt_r_item("w.U.jai", w_I_jai);
    wrt_r_item("w.U.mareco", w_I_mareco);
     	
    wrt_r_item("w.lc.nad", w_lc_nad);
    wrt_r_item("w.lc.mad", w_lc_mad);
    //wrt_r_item("w.lc.sad", w_lc_sad);
    	
    wrt_r_item("w.ac.cRn", w_ac_cRn);
    wrt_r_item("w.ac.cRs", w_ac_cRs);
    wrt_r_item("w.ac.cBn", w_ac_cBn);
    wrt_r_item("w.ac.cBs", w_ac_cBs);
    
    wrt_r_item("w.Nage.init", w_Nage_init);
    wrt_r_item("w.R", w_rec);
    wrt_r_item("w.R.init", w_rec_early);
    wrt_r_item("w.R.end", w_rec_end);
    wrt_r_item("w.F.early.phases", w_fullF);
    wrt_r_item("w.Ftune.early.phases", w_Ftune);
    wrt_r_item("var.RWq", set_RWq_var);

 close_r_vector();

    open_r_matrix("N.age");
    wrt_r_matrix(N, 2, 2);
    wrt_r_namevector(styr, (endyr+1));
    wrt_r_namevector(agebins);
    close_r_matrix();

    open_r_matrix("N.age.mdyr");
    wrt_r_matrix(N_mdyr, 2, 2);
    wrt_r_namevector(styr, endyr);
    wrt_r_namevector(agebins);
    close_r_matrix();

    open_r_matrix("N.age.spawn");
    wrt_r_matrix(N_spawn, 2, 2);
    wrt_r_namevector(styr, endyr); 
    wrt_r_namevector(agebins);
    close_r_matrix();

    open_r_matrix("B.age");
    wrt_r_matrix(B, 2, 2);
    wrt_r_namevector(styr, (endyr+1));
    wrt_r_namevector(agebins);
    close_r_matrix();

    open_r_matrix("B.mdyr.age");
    wrt_r_matrix(B_mdyr, 2, 2);
    wrt_r_namevector(styr, (endyr+1));
    wrt_r_namevector(agebins);
    close_r_matrix();

    open_r_matrix("F.age");
    wrt_r_matrix(F, 2, 2);
    wrt_r_namevector(styr,endyr);
    wrt_r_namevector(agebins);
    close_r_matrix();
  
    open_r_matrix("M.age");
    wrt_r_matrix(tv_M, 2, 2);
    wrt_r_namevector(styr,endyr);
    wrt_r_namevector(agebins);
    close_r_matrix();

    open_r_matrix("Z.age");
    wrt_r_matrix(Z, 2, 2);
    wrt_r_namevector(styr,endyr);
    wrt_r_namevector(agebins);
    close_r_matrix();
	
    open_r_matrix("L.age.pred.knum");
    wrt_r_matrix(L_total_num, 2, 2);
    wrt_r_namevector(styr,endyr);
    wrt_r_namevector(agebins);   
    close_r_matrix();
    
    open_r_matrix("L.age.pred.mt");
    wrt_r_matrix(L_total_mt, 2, 2);
    wrt_r_namevector(styr,endyr);
    wrt_r_namevector(agebins);   
    close_r_matrix();

    open_r_matrix("SSB.age.pred");
    wrt_r_matrix(SSBatage, 2, 2);
    wrt_r_namevector(styr,endyr);
    wrt_r_namevector(agebins);
    close_r_matrix();
    
    //open_r_matrix("reprod.tv");
    //wrt_r_matrix(reprod_tv, 2, 2);
    //wrt_r_namevector(styr,endyr);
    //wrt_r_namevector(agebins);
    //close_r_matrix();
    
     
// LIST object with annual selectivity at age by fishery

open_r_list("size.age.fishery");

    open_r_matrix("len.cR.mm");
    wrt_r_matrix(len_cR_mm, 2, 2);
    wrt_r_namevector(styr,endyr);
    wrt_r_namevector(agebins);
    close_r_matrix();

    open_r_matrix("wholewgt.cR.mt");
    wrt_r_matrix(wholewgt_cR_mt*1000.0, 2, 2);
    wrt_r_namevector(styr,endyr);
    wrt_r_namevector(agebins);
    close_r_matrix();

close_r_list();

open_r_list("sel.age");

    wrt_r_complete_vector("sel.v.wgted.L",sel_wgted_L, agebins);
    wrt_r_complete_vector("sel.v.wgted.tot",sel_wgted_tot, agebins);

    open_r_matrix("sel.m.cRn");
    wrt_r_matrix(sel_cRn, 2, 2);
    wrt_r_namevector(styr,endyr);
    wrt_r_namevector(agebins);
    close_r_matrix();

    open_r_matrix("sel.m.cRs");
    wrt_r_matrix(sel_cRs, 2, 2);
    wrt_r_namevector(styr,endyr);
    wrt_r_namevector(agebins);
    close_r_matrix();

    open_r_matrix("sel.m.cBn");
    wrt_r_matrix(sel_cBn, 2, 2);
    wrt_r_namevector(styr,endyr);
    wrt_r_namevector(agebins);
    close_r_matrix();

    open_r_matrix("sel.m.cBs");
    wrt_r_matrix(sel_cBs, 2, 2);
    wrt_r_namevector(styr,endyr);
    wrt_r_namevector(agebins);
    close_r_matrix();
	
    open_r_matrix("sel.m.nad");
    wrt_r_matrix(sel_nad, 2, 2);
    wrt_r_namevector(styr_nad_cpue,endyr_nad_cpue);
    wrt_r_namevector(agebins);
    close_r_matrix();
	
    open_r_matrix("sel.m.mad");
    wrt_r_matrix(sel_mad, 2, 2);
    wrt_r_namevector(styr_mad_cpue,endyr_mad_cpue);
    wrt_r_namevector(agebins);
    close_r_matrix();

    //open_r_matrix("sel.m.sad");
    //wrt_r_matrix(sel_sad, 2, 2);
    //wrt_r_namevector(styr_sad_cpue,endyr_sad_cpue);
    //wrt_r_namevector(agebins);
    //close_r_matrix();

 close_r_list();


//LIST object with predicted and observed composition data
open_r_list("comp.mats");

    open_r_matrix("acomp.cRn.ob");
    wrt_r_matrix(obs_cRn_agec, 2, 2);
    wrt_r_namevector(yrs_cRn_agec);
    wrt_r_namevector(agebins_agec);
    close_r_matrix();

    open_r_matrix("acomp.cRn.pr");
    wrt_r_matrix(pred_cRn_agec, 2, 2);
    wrt_r_namevector(yrs_cRn_agec);
    wrt_r_namevector(agebins_agec);
    close_r_matrix();

    open_r_matrix("acomp.cRs.ob");
    wrt_r_matrix(obs_cRs_agec, 2, 2);
    wrt_r_namevector(yrs_cRs_agec);
    wrt_r_namevector(agebins_agec);
    close_r_matrix();

    open_r_matrix("acomp.cRs.pr");
    wrt_r_matrix(pred_cRs_agec, 2, 2);
    wrt_r_namevector(yrs_cRs_agec);
    wrt_r_namevector(agebins_agec);
    close_r_matrix();

    open_r_matrix("acomp.cBn.ob");
    wrt_r_matrix(obs_cBn_agec, 2, 2);
    wrt_r_namevector(yrs_cBn_agec);
    wrt_r_namevector(agebins_agec);
    close_r_matrix();

    open_r_matrix("acomp.cBn.pr");
    wrt_r_matrix(pred_cBn_agec, 2, 2);
    wrt_r_namevector(yrs_cBn_agec);
    wrt_r_namevector(agebins_agec);
    close_r_matrix();

    open_r_matrix("acomp.cBs.ob");
    wrt_r_matrix(obs_cBs_agec, 2, 2);
    wrt_r_namevector(yrs_cBs_agec);
    wrt_r_namevector(agebins_agec);
    close_r_matrix();

    open_r_matrix("acomp.cBs.pr");
    wrt_r_matrix(pred_cBs_agec, 2, 2);
    wrt_r_namevector(yrs_cBs_agec);
    wrt_r_namevector(agebins_agec);
    close_r_matrix();

    open_r_matrix("lcomp.nad.ob");
    wrt_r_matrix(obs_nad_lenc, 2, 2);
    wrt_r_namevector(yrs_nad_lenc);
    wrt_r_namevector(lenbins);
    close_r_matrix();

    open_r_matrix("lcomp.nad.pr");
    wrt_r_matrix(pred_nad_lenc, 2, 2);
    wrt_r_namevector(yrs_nad_lenc);
    wrt_r_namevector(lenbins);
    close_r_matrix();  

    open_r_matrix("lcomp.mad.ob");
    wrt_r_matrix(obs_mad_lenc, 2, 2);
    wrt_r_namevector(yrs_mad_lenc);
    wrt_r_namevector(lenbins);
    close_r_matrix();

    open_r_matrix("lcomp.mad.pr");
    wrt_r_matrix(pred_mad_lenc, 2, 2);
    wrt_r_namevector(yrs_mad_lenc);
    wrt_r_namevector(lenbins);
    close_r_matrix();  

    //open_r_matrix("lcomp.sad.ob");
    //wrt_r_matrix(obs_sad_lenc, 2, 2);
    //wrt_r_namevector(yrs_sad_lenc);
    //wrt_r_namevector(lenbins);
    //close_r_matrix();

    //open_r_matrix("lcomp.sad.pr");
    //wrt_r_matrix(pred_sad_lenc, 2, 2);
    //wrt_r_namevector(yrs_sad_lenc);
    //wrt_r_namevector(lenbins);
    //close_r_matrix();  

 close_r_list();

// DATA FRAME of time series
open_r_df("t.series", styr, (endyr+1), 2);
    wrt_r_namevector(styr,(endyr+1));
    wrt_r_df_col("year", styr,(endyr+1));
    //wrt_r_df_col("F.Fmsy", FdF_msy);
    //wrt_r_df_col("F.F30.ratio", FdF30);	//*.ratio extension is for FishGraph
    wrt_r_df_col("F.full", Fapex);
    wrt_r_df_col("F.cRn", F_cRn_out);
    wrt_r_df_col("F.cRs", F_cRs_out);
    wrt_r_df_col("F.cBn", F_cBn_out);
    wrt_r_df_col("F.cBs", F_cBs_out);
    wrt_r_df_col("Fsum", Fsum);
    wrt_r_df_col("N", totN); //abundance at start of year
    wrt_r_df_col("recruits", rec);
    wrt_r_df_col("logR.dev", log_rec_dev_output); //places zeros in yrs deviations not estimated  //KWS
    wrt_r_df_col("SSB", SSB);
    //wrt_r_df_col("SSB.SSBmsy", SdSSB_msy);
    //wrt_r_df_col("SSB.SSBF30", SdSSB_F30);
    wrt_r_df_col("B", totB);
    //wrt_r_df_col("B.B0", totB/B0);
    wrt_r_df_col("SPR.static", spr_static);

    wrt_r_df_col("total.L.mt", L_total_mt_yr);
    //wrt_r_df_col("total.L.knum", L_total_knum_yr);
    
    wrt_r_df_col("U.nad.ob", obs_nad_cpue);
    wrt_r_df_col("U.nad.pr", pred_nad_cpue);
    wrt_r_df_col("cv.U.nad", nad_cpue_cv/w_I_nad);  //applied CV after weighting
    wrt_r_df_col("cv.unwgted.U.nad", nad_cpue_cv); //CV before weighting

    wrt_r_df_col("U.mad.ob", obs_mad_cpue);
    wrt_r_df_col("U.mad.pr", pred_mad_cpue);
    wrt_r_df_col("cv.U.mad", mad_cpue_cv/w_I_mad);  //applied CV after weighting
    wrt_r_df_col("cv.unwgted.U.mad", mad_cpue_cv); //CV before weighting

    wrt_r_df_col("U.sad.ob", obs_sad_cpue);
    wrt_r_df_col("U.sad.pr", pred_sad_cpue);
    wrt_r_df_col("cv.U.sad", sad_cpue_cv/w_I_sad);  //applied CV after weighting
    wrt_r_df_col("cv.unwgted.U.sad", sad_cpue_cv); //CV before weighting

    wrt_r_df_col("U.jai.ob", obs_jai_cpue);
    wrt_r_df_col("U.jai.pr", pred_jai_cpue);
    wrt_r_df_col("cv.U.jai", jai_cpue_cv/w_I_jai);  //applied CV after weighting
    wrt_r_df_col("cv.unwgted.U.jai", jai_cpue_cv);  //CV before weighting
    
    //wrt_r_df_col("U.mareco.ob", obs_mareco_cpue);		 //wrt_r_df_col("acomp.cRn.nfish", nfish_cRn_agec_allyr);
    //wrt_r_df_col("U.mareco.pr", pred_mareco_cpue);
    //wrt_r_df_col("cv.U.mareco", mareco_cpue_cv/w_I_mareco);  //applied CV after weighting
    //wrt_r_df_col("cv.unwgted.U.mareco", mareco_cpue_cv);  //CV before weighting
   
    wrt_r_df_col("q.nad", q_nad);
    wrt_r_df_col("q.nad.rate.mult",q_rate_fcn_nad);
    wrt_r_df_col("q.nad.RW.log.dev",q_RW_log_dev_nad);

    wrt_r_df_col("q.mad", q_mad);
    wrt_r_df_col("q.mad.rate.mult",q_rate_fcn_mad);
    wrt_r_df_col("q.mad.RW.log.dev",q_RW_log_dev_mad);

    wrt_r_df_col("q.sad", q_sad);
    wrt_r_df_col("q.sad.rate.mult",q_rate_fcn_sad);
    wrt_r_df_col("q.sad.RW.log.dev",q_RW_log_dev_sad);

    wrt_r_df_col("q.jai", q_jai);
    wrt_r_df_col("q.jai.rate.mult",q_rate_fcn_jai);
    wrt_r_df_col("q.jai.RW.log.dev",q_RW_log_dev_jai);
    
    wrt_r_df_col("q2.jai", q2_jai);

    wrt_r_df_col("q.mar", q_mar);
    
    wrt_r_df_col("q.eco", q_eco);
     
    wrt_r_df_col("q.DD.mult", q_DD_fcn);
    wrt_r_df_col("q.DD.B.exploitable", B_q_DD);

    wrt_r_df_col("L.cRn.ob", obs_cRn_L);
    wrt_r_df_col("L.cRn.pr", pred_cRn_L_mt);
    wrt_r_df_col("cv.L.cRn", cRn_L_cv);

    wrt_r_df_col("L.cRs.ob", obs_cRs_L);
    wrt_r_df_col("L.cRs.pr", pred_cRs_L_mt);
    wrt_r_df_col("cv.L.cRs", cRs_L_cv);

    wrt_r_df_col("L.cBn.ob", obs_cBn_L);
    wrt_r_df_col("L.cBn.pr", pred_cBn_L_mt);
    wrt_r_df_col("cv.L.cBn", cBn_L_cv);

    wrt_r_df_col("L.cBs.ob", obs_cBs_L);
    wrt_r_df_col("L.cBs.pr", pred_cBs_L_mt);
    wrt_r_df_col("cv.L.cBs", cBs_L_cv);

    //comp sample sizes
	wrt_r_df_col("lcomp.nad.n", nsamp_nad_lenc_allyr);
	wrt_r_df_col("lcomp.mad.n", nsamp_mad_lenc_allyr);
	//wrt_r_df_col("lcomp.sad.n", nsamp_sad_lenc_allyr);
	
        wrt_r_df_col("acomp.cRn.n", nsamp_cRn_agec_allyr);
        wrt_r_df_col("acomp.cRs.n", nsamp_cRs_agec_allyr);
        wrt_r_df_col("acomp.cBn.n", nsamp_cBn_agec_allyr);
        wrt_r_df_col("acomp.cBs.n", nsamp_cBs_agec_allyr);
   	
	wrt_r_df_col("lcomp.nad.nfish", nfish_nad_lenc_allyr);
	wrt_r_df_col("lcomp.mad.nfish", nfish_mad_lenc_allyr);
	//wrt_r_df_col("lcomp.sad.nfish", nfish_sad_lenc_allyr);
		
        wrt_r_df_col("acomp.cRn.nfish", nfish_cRn_agec_allyr);
        wrt_r_df_col("acomp.cRs.nfish", nfish_cRs_agec_allyr);
        wrt_r_df_col("acomp.cBn.nfish", nfish_cBn_agec_allyr);
        wrt_r_df_col("acomp.cBs.nfish", nfish_cBs_agec_allyr);
   		
	wrt_r_df_col("lcomp.nad.neff", (1+nsamp_nad_lenc_allyr*exp(log_dm_nad_lc_out(8)))/(1+exp(log_dm_nad_lc_out(8))));
	wrt_r_df_col("lcomp.mad.neff", (1+nsamp_mad_lenc_allyr*exp(log_dm_mad_lc_out(8)))/(1+exp(log_dm_mad_lc_out(8))));
	//wrt_r_df_col("lcomp.sad.neff", (1+nsamp_sad_lenc_allyr*exp(log_dm_sad_lc_out(8)))/(1+exp(log_dm_sad_lc_out(8))));
	
        wrt_r_df_col("acomp.cRn.neff", (1+nsamp_cRn_agec_allyr*exp(log_dm_cRn_ac_out(8)))/(1+exp(log_dm_cRn_ac_out(8))));
        wrt_r_df_col("acomp.cRs.neff", (1+nsamp_cRs_agec_allyr*exp(log_dm_cRs_ac_out(8)))/(1+exp(log_dm_cRs_ac_out(8))));
        wrt_r_df_col("acomp.cBn.neff", (1+nsamp_cBn_agec_allyr*exp(log_dm_cBn_ac_out(8)))/(1+exp(log_dm_cBn_ac_out(8))));
        wrt_r_df_col("acomp.cBs.neff", (1+nsamp_cBs_agec_allyr*exp(log_dm_cBs_ac_out(8)))/(1+exp(log_dm_cBs_ac_out(8))));
        
 close_r_df();

open_r_df("U.series", 1, 26, 2);
    wrt_r_namevector(1,26);    
    wrt_r_df_col("U.mareco.ob", obs_mareco_cpue);		 
    wrt_r_df_col("U.mareco.pr", pred_mareco_cpue);
    wrt_r_df_col("cv.U.mareco", mareco_cpue_cv/w_I_mareco);  //applied CV after weighting
    wrt_r_df_col("cv.unwgted.U.mareco", mareco_cpue_cv);  //CV before weighting
         
 close_r_df();

     
// DATA FRAME of L and D time series by fishery
open_r_df("LD.pr.tseries", styr, endyr, 2);
	wrt_r_namevector(styr,endyr);
	wrt_r_df_col("year", styr, endyr);

        wrt_r_df_col("L.cRn.mt", pred_cRn_L_mt);
        wrt_r_df_col("L.cRs.mt", pred_cRs_L_mt);
        wrt_r_df_col("L.cBn.mt", pred_cBn_L_mt);
        wrt_r_df_col("L.cBs.mt", pred_cBs_L_mt);
        //wrt_r_df_col("L.cR.knum", pred_cR_L_knum);
    
close_r_df();

 open_r_df("a.series", 1, nages, 2);
 	wrt_r_namevector(1,nages);
 	wrt_r_df_col("age", agebins);
 	wrt_r_df_col("length", meanlen_FL);
 	wrt_r_df_col("length.cv.nad", len_cv_nad);
	wrt_r_df_col("length.cv.mad", len_cv_mad);
	//wrt_r_df_col("length.cv.sad", len_cv_sad);
 	//wrt_r_df_col("length.sd", len_sd);
 	wrt_r_df_col("weight.middle", wgt_fish_mt);     //for FishGraph
        wrt_r_df_col("weight.spawn", wgt_spawn_mt);
 	wrt_r_df_col("wholewgt.wgted.L.mt", wgt_wgted_L_mt);
 	wrt_r_df_col("prop.female", prop_f);
        wrt_r_df_col("prop.male", prop_m);	
   	wrt_r_df_col("mat.female", maturity_f);
   	wrt_r_df_col("mat.male", maturity_m);	
 	wrt_r_df_col("reprod", reprod);
	wrt_r_df_col("fecundity", fecundity);
 	
 	wrt_r_df_col("M", M);
 	wrt_r_df_col("F.initial", F_initial);
 	wrt_r_df_col("Z.initial", Z_initial);
 	wrt_r_df_col("Nage.eq.init",N_initial_eq);
 	wrt_r_df_col("log.Nage.init.dev",log_Nage_dev_output);
 close_r_df();


 open_r_df("eq.series", 1, n_iter_msy, 2);
 	wrt_r_namevector(1,n_iter_msy);
 	wrt_r_df_col("F.eq", F_msy);
 	wrt_r_df_col("spr.eq", spr_msy);
 	wrt_r_df_col("R.eq", R_eq);
 	wrt_r_df_col("SSB.eq", SSB_eq);
 	wrt_r_df_col("B.eq", B_eq);
 	wrt_r_df_col("L.eq.mt", L_eq_mt);
 	//wrt_r_df_col("L.eq.knum", L_eq_knum);
 close_r_df();

 open_r_df("pr.series", 1, n_iter_spr, 2);
 	wrt_r_namevector(1,n_iter_spr);
 	wrt_r_df_col("F.spr", F_spr);
 	wrt_r_df_col("spr", spr_spr);
 	wrt_r_df_col("SPR", spr_ratio);
 	wrt_r_df_col("L.ypr.mt", L_spr); //whole weight
 close_r_df();


 open_r_list("CLD.est.mats");

     open_r_matrix("Lw.cRn");
         wrt_r_matrix(L_cRn_mt, 1,1);
     close_r_matrix();

     open_r_matrix("Lw.cRs");
         wrt_r_matrix(L_cRs_mt, 1,1);
     close_r_matrix();

     open_r_matrix("Lw.Bn");
         wrt_r_matrix(L_cBn_mt, 1,1);
     close_r_matrix();

     open_r_matrix("Lw.cBs");
         wrt_r_matrix(L_cBs_mt, 1,1);
     close_r_matrix();

     open_r_matrix("Lw.total");
         wrt_r_matrix(L_total_mt, 1,1);
     close_r_matrix();

     open_r_matrix("Ln.cRn");
         wrt_r_matrix(L_cRn_num, 1,1);
     close_r_matrix();

     open_r_matrix("Ln.cRs");
         wrt_r_matrix(L_cRs_num, 1,1);
     close_r_matrix();

     open_r_matrix("Ln.cBn");
         wrt_r_matrix(L_cBn_num, 1,1);
     close_r_matrix();

     open_r_matrix("Ln.cBs");
         wrt_r_matrix(L_cBs_num, 1,1);
     close_r_matrix();

     open_r_matrix("Ln.total");
         wrt_r_matrix(L_total_num, 1,1);
     close_r_matrix();

close_r_list();

  //LIST object of age error matrix
open_r_list("age.error");

    open_r_matrix("error.mat");		
    wrt_r_matrix(age_error, 2, 2);
    wrt_r_namevector(agebins);
    wrt_r_namevector(agebins);
    close_r_matrix();
  
close_r_list();

// DATA FRAME of projection time series
open_r_df("projection", styr_proj, endyr_proj, 2);
    wrt_r_namevector(styr_proj,endyr_proj);
    wrt_r_df_col("year", styr_proj,endyr_proj);
    wrt_r_df_col("F.proj", F_proj);
    wrt_r_df_col("SSB.proj", SSB_proj);
    wrt_r_df_col("B.proj", B_proj);
    wrt_r_df_col("R.proj", R_proj);
    wrt_r_df_col("L.knum.proj", L_knum_proj);
    wrt_r_df_col("L.mt.proj", L_mt_proj);
	
 close_r_df();

close_r_file();
