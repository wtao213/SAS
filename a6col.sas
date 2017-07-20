proc reg data=  WORK.DEV2(obs=5000);
    model default = /*funded_amnt_inv*/ /*loan_amnt*/ funded_amnt int_rate installment  
		annual_inc dti delinq_2yrs inq_last_6mths /*open_acc*/ pub_rec revol_bal 
		revol_util /*total_acc*/ /*out_prncp*/ /*out_prncp_inv*/ /*total_pymnt*/ /*total_pymnt_inv*/ 
		total_rec_prncp /*total_rec_int*/ total_rec_late_fee /*recoveries*/ 
		/*collection_recovery_fee*/ last_pymnt_amnt acc_now_delinq tot_coll_amt 
		/*tot_cur_bal*/ open_acc_6m open_il_6m open_il_12m open_il_24m mths_since_rcnt_il 
		total_bal_il il_util open_rv_12m open_rv_24m max_bal_bc all_util 
		total_rev_hi_lim inq_fi total_cu_tl inq_last_12m /*acc_open_past_24mths*/ 
		avg_cur_bal bc_open_to_buy bc_util mo_sin_old_il_acct mo_sin_old_rev_tl_op 
		mo_sin_rcnt_rev_tl_op mo_sin_rcnt_tl mort_acc mths_since_recent_bc 
		mths_since_recent_inq num_accts_ever_120_pd num_actv_bc_tl /*num_actv_rev_tl*/ 
		num_bc_sats num_bc_tl num_il_tl num_op_rev_tl num_rev_accts 
		/*num_rev_tl_bal_gt_0*/ /*num_sats*/ num_tl_120dpd_2m num_tl_30dpd num_tl_90g_dpd_24m 
		num_tl_op_past_12m pct_tl_nvr_dlq percent_bc_gt_75 pub_rec_bankruptcies 
		tax_liens /*tot_hi_cred_lim*/ /*total_bal_ex_mort*/ total_bc_limit 
		total_il_high_credit_limit grade_num / influence  collin tol vif stb;
    run;
quit;