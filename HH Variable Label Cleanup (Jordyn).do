*Hospitality House Variable Cleanup (Jordyn)
*-------------------------------------------
 
import delimited "/Volumes/USB DISK/Hospitality_House-6.csv", encoding(ISO-8859-1)
*Import Data from CSV file

drop v1 v2 v3 v4 v5 v6
*Drop the responseID columns- only provided as a reference for qualtircs 
drop v7 
*Drop the status code: 0=normal response
drop v11

drop in 1/2

rename v8 StartDate
rename v9 EndDate
*we could technically drop these, but ok to keep. 


rename v10 COMP
label variable COMP "Completed"
destring COMP, replace
label define COMP_label 1. "1. Yes"
label values COMP COMP_label
*v10 Destring and label Completed*

rename v12 LAN
label variable LAN "Language"
destring LAN, replace
label define LAN_label 1 "1.English" 2 "2.Spanish" 3 "3.Cantonese" 
label values LAN LAN_label
* v12 Destring and label language.



gen ENG=0
replace ENG=1 if LAN==1
tab ENG

gen SPAN=0
replace SPAN=1 if LAN==2
tab SPAN

gen CANTON=0
replace CANTON=1 if LAN==3
tab CANTON
*Generate Dummy Variables for English Spanish Cantonese



rename v13 RESPONDENT
*v13 Rename Respondent

rename v14 PROG
label variable PROG "Program"
destring PROG, replace
label define PROG_label 1 "1.SSHC" 2 "2.TSHC" 3 "3.SP" 4 "4.ERC" 5 "5.CA" 6 "6.CBP"
label values PROG PROG_label
* v14 Destring and label Program

rename v15 REF
label variable REF "Refused"
destring REF, replace
label define REF_label 1 "1.Yes" 2. "2. No"
label values REF REF_label
* v15 Destring and label Refused

rename v16 STASAT
label variable STASAT "I am satisfied with the staff"
destring STASAT, replace
label define SAT_label 1 "1. Strongly Agree" 2 "2. Agree" 3 "3. Neutral" 4 "4. Disagree" 5 "5. Strongly Disagree" 6 "6. N/A"
label values STASAT SAT_label
*v16 Destring and label Satisfied with Staff
rename v17 STASAT_text
*All variables that end with text are comments

rename v18 STASPA 
label variable STASPA "I like the physical program space"
destring STASPA, replace 
label values STASPA SAT_label
*v18 Destring and label satisfied with program space
rename v19 STASPA_text


rename v20 STASAF
label variable STASAF "I feel safe here"
destring STASAF, replace
label values STASAF SAT_label
*v20 Destring and label I feel safe here. 
rename v21 STASAF_text

rename v22 STAINP
label variable STAINP "My input is valued"
destring STAINP, replace
label values STAINP SAT_label
rename v23 STAINP_text

rename v24 STARES
label variable STARES "People from all cultures are welcomed and treated with respect"
destring STARES, replace
label values STARES SAT_label
rename v25 STARES_text

rename v26 STADAI
label variable STADAI "I am more able to meet my daily needs"
destring STADAI, replace
label values STADAI SAT_label
rename v27 STADAI_text

rename v28 STACOM
label variable STACOM "I feel less isolated and more a part of a community"
destring STACOM, replace
label values STACOM SAT_label
rename v29 STACOM_text

rename v30 STAIMP
label variable STAIMP "Hospitality House services have had a positive impact on my life"
destring STAIMP, replace
label values STAIMP SAT_label
rename v31 STAIMP_text

rename v32 STAINV
label variable STAINV "I plan to continue my involvement with Hospitality House"
destring STAINV, replace 
label values STAINV SAT_label
rename v33 STAINV_text



rename v34 OUTHOU
label variable OUTHOU "Housing"
rename v35 OUTEMP
label variable OUTEMP "Employment/Income"
rename v36 OUTSUB
label variable OUTSUB "Substance Use/Mental Health"
rename v37 OUTART
label variable OUTART "Artwork Sales"
rename v38 OUTVOL
label variable OUTVOL "Volunteer Experience"
rename v39 OUTBEN
label variable OUTBEN "Benefits Obtained (e.g SSI, GA, FoodStamps)"
rename v40 OUTSKI
label variable OUTSKI "New Skills Obtained"
rename v41 OUTOTH
label variable OUTOTH "Other"
rename v42 OUT_text
rename v43 OUTNA
label variable OUTNA "N/A"
rename v44 OUTCOM
label variable OUTCOM "Comment"


rename v45 TIME
label variable TIME "Length of time in the program"
destring TIME, replace 
label define TIME_label 1 "1. 10 or more years" 2 "2. 6-10 years" 3 "3. 1-5 years" 4 "4. Less than 1 year" 5 "5. N/A"
label values TIME TIME_label
*v45 Destring and label length of time in the program

rename v46 VET
label variable VET "Are you a Veteran?"
destring VET, replace
label define VET_label 1 "1. Yes" 2 "2. No" 3 "3. N/A"
label values VET VET_label
*v46 Destring and label if they are a veteran

rename v47 AGE
label variable AGE "Age (in years)" 
destring AGE, replace
label define AGE_label 1 "1. 0-19" 2 "2. 20-29" 3 "3. 30-39" 4 "4. 40-49" 5 "5. 50-59" 6 "6. 60-69" 7 "7. 70-79" 8 "8. 80-89" 9 "9. 90-99" 10 "10. N/A"
label values AGE AGE_label
*v47 Destring and label AGE 

rename v48 GENDER
label variable GENDER "What is your gender identity?"
destring GENDER, replace
label define GENDER_label 1 "1. Female" 2 "2. Male" 3 "3. Trans Female" 4 "4. Trans Male" 5 "5. Other" 6 "6. N/A" 
label values GENDER GENDER_label
*V48 Destring and label GENDER 

rename v49 HOUSE
label variable HOUSE "Do you have stable housing?"
destring HOUSE, replace
label define HOUSE_label 1 "1. Yes" 2 "2. No" 3 "3. N/A"
label values HOUSE HOUSE_label
*v49 Destring and label if respondent has housing. 

rename v50 RACE
label variable RACE "What is your Ethnicity?"
destring RACE, replace
label define RACE_label 1 "1. Asian" 2 "2. Black / African American" 3 "3. Latino" 4 "4. Native American" 5 "5. Native Hawaiian / Pacific Islander" 6 "6. White" 7 "7. Multi-Ethnic" 8 "8. N/A" 
label values RACE RACE_label  
*v50 Destring and label ethnicity

rename v51 ADCOMMENT


drop v52 v53 v54



*install outreg
ssc install outreg2



*Generating only satisfaction variables

gen Q1satisfied = STASAT < 3
replace Q1satisfied = . if STASAT  ==. 


gen Q2satisfied = STASPA < 3
replace Q2satisfied = . if STASPA  ==. 


gen Q3satisfied = STASAF < 3 
replace Q3satisfied = . if STASAF  ==. 


gen Q4satisfied = STAINP < 3 
replace Q4satisfied = . if STAINP  ==. 


gen Q5satisfied = STARES < 3 
replace Q5satisfied = . if STARES  ==. 


gen Q6satisfied = STADAI < 3
replace Q6satisfied = . if STADAI  ==. 


gen Q7satisfied = STACOM < 3
replace Q7satisfied = . if STACOM  ==. 


gen Q8satisfied = STAIMP < 3
replace Q8satisfied = . if STAIMP  ==. 



gen Q9satisfied = STAINV < 3
replace Q9satisfied = . if STAINV  ==. 


* , row describes a summary of variables in percent 







 
















