#Statistical Analysis of Factors Associated with Cardiovascular Disease 
by Davin Kaing, Muhammad Waqas, and Shane Duan

##Introduction

According to the Center of Disease Control and Prevention, heart disease is the leading cause of deaths in the United States. This disease affects many patients and their families’ lives regardless of characteristics such as age, gender, or race. For this reason, it important to determine the variables that can diagnose heart disease so that preventative measures can be implemented. These measures will serve to save time and money for the individuals and society. 

In this project, our team will investigate the relationships between factors that lead to heart disease. Some of these factors include: sex of patients, exercise induced angina, type of chest pain patients experience, resting blood pressure, age, and maximum heart rate.

Some questions we will be investigating are:
- Is there any association between an individual's sex and whether they experience exercise induced angina?
- Do patients with atypical chest pain have a higher resting blood pressure than patients who experience typical chest pain? 
- Does the maximum heart rate of patients decrease as their age increases?
	
It is commonly believed that experiencing angina is indicative of heart disease. Angina, also known as myocardial ischemia, is a sharp pain in the chest. This pain occurs when an area of the heart does not receive enough oxygenated blood and causes discomfort for the individuals, and is most notable during exercise because the heart needs oxygenated blood. Since males are more active than females,2 our study explores if males experience exercise induced angina more readily than females.

Furthermore, since pain associated with angina is chronic, we assume that patients with angina will experience typical chest pain. Patients with cardiovascular disease will have high resting blood pressure, so it is reasonable to assume that patients who experience typical chest pain will have a significantly higher resting blood pressure because they are most likely to have cardiovascular disease. Our study aims to determine if patients with typical chest pain actually do have significantly higher resting blood pressure.
Finally, studies have shown that with age, the maximal heart rate decreases in individuals because the heart is less able to handle the stress of high heart rate. To determine if this statement is true, our project aims to determine if age lowers maximum heart rate.

##Methods

The population of interest is those with cardiovascular disease who were treated at the Cleveland Clinic Foundation and were recorded in the dataset donated to the UC Irvine Machine Learning Repository by David Aha on 1988 July 1st.  This sample is not a random sample as the data is for patients that were treated at the specific clinic.

The sample includes 303 members with 75 attributes. In this study, we will use R to determine the associations between the following attributes:
- An individual's sex (male/female) and if they experience exercise induced angina (yes/no).
- An individual's chest pain type (typical/atypical) and resting blood pressure.
- Maximum heart rate and age.

If we consider our target population to be all people with heart disease, this population is biased. This project only considers those with heart disease in Cleveland. This will affect the results greatly, because of cultural differences: for example, those living in China and Japan have ready access to daily morning “radio exercises” for unity and to “warm up” for the day,3 whereas Americans have no such equivalent. Since a more active lifestyle (in this case, brought on by something unrelated to preventing heart disease) has been proven to reduce rates of heart disease, the results in America, for example, could be inaccurate in China and Japan. However, for those living in an environment and culture similar to that of Cleveland, this dataset is representative. 

##Results and Discussion

For this project, there are three claims that are tested. These claims explore factors that are associated with heart disease. 

###Claim I 
The first claim states that there is a higher proportion of male patients with exercise-induced angina (EIA) than female.To explore this, we first summarized the frequency and proportion of the two sexes and their association with induced angina (Table 1). As shown in Table 1 and Figure 1, males have a higher proportion that is linked to exercise-induced angina than females. 

![](http://i.imgur.com/HsfjE4Y.png)

![](http://i.imgur.com/uIvK4QX.png)

Since these are both categorical variables, we performed a two-sample proportion test under two assumptions: 
The samples are independent since one population is male and the other is female
The sample sizes are large enough:
- nmpm=74 ≥ 10 and nm(1-pm)=117 ≥ 10
- nfpf=18 ≥ 10 and nf(1-pf)=73 ≥ 10

(Where nm= number of males, nf= number of females; pm= proportion of males with EIA, pf= proportion of females with EIA)

The result from this test further support our claim. The p-value (Table 2) was calculated to be less than the significance level of 0.05, so it is appropriate to reject H0and conclude that there is a higher proportion of males with exercise induced angina than females at a 5% significance level.

![](http://i.imgur.com/YFLWyTV.png)

###Claim II
The second investigative question explores the association between the type of chest pain the patient experiences and their resting blood pressure. Our claim for this investigation states that those with atypical angina have a significantly lower resting blood pressure than those with typical angina. We first visualize this difference using a boxplot (Figure 2). From this plot, it appears that resting blood pressure of atypical angina is lower than that of typical angina.

![](http://i.imgur.com/CkSENZP.png)

To quantify the difference between these two groups, we used a two-sample t-test under the following assumptions: 
- The samples are independent because typical and atypical angina are not dependent. 
- The sample size is large as stated in the previous investigation. 
- The population variances are unknown and assumed to be unequal.

The reported p-value (Table 3) is less than the 5% significance level. We can thus reject H0 and conclude that the resting blood pressure of patients who experienced atypical angina is significantly less than that of those with typical angina at a 5% significance level.

![](http://i.imgur.com/jrn2Mk2.png)

###Claim III 
Our last investigative question explores the correlation between the age of the patients and the maximum heart rate achieved after exercise. The claim for this investigation is that the greater the patient’s age the lower the maximum heart rate achieved after exercise. To visualize the this relationship, a scatter plot was used (Figure 3). For this analysis, regression analysis is most suitable under the assumption that there is a linear relationship between age and maximum heart rate achieved after exercise. To perform regression analysis, we created a linear model, shown as blue line in Figure 3, to examine the relationship between patient’s age and their maximum heart rate. The coefficient of determination (R2) is 0.1516. This means that 15.16% of maximum heart rates variation is explained by the linear model. In this case, the coefficient of determination is low, hence the relationship is not strong. Although the relationship isn’t strong, there appears to be a decreasing trend in maximum heart rate for older patients. This evidence supports our claim. 

![](http://i.imgur.com/zCEs7DC.png)
![](http://i.imgur.com/J2EznEL.png)

##Conclusion
From our analysis, we concluded that a higher proportion of male patients have exercise-induced angina than female. From our second investigation, we concluded that the atypical angina has a significantly lower resting blood pressure than the typical angina. Lastly, our final investigation reveals that the greater the patient’s age, the lower the maximum heart rate achieved after exercise. 

However, there are also limitations to this study. One of them is that the study cannot be generalized to the entire population of the U.S. since the data used is only collected from Cleveland, OH. Another limitation is that we do not know if the collected data is a simple random sample, as the author did not mention this at the data source. If it is not a random sample, the analysis can be biased. Whether the sample is representative of the entire population of study is also a concern because without a representative sample, the analysis can also generate biased results. 

Possible ways to improve these limitations are to collect data that is representative of the entire population and to collect the data in a controlled environment over a long period of time. For our first improvement, it is critical to have data that is representative of the entire population. This way, our analysis is more accurate and can be generalized to the entire population. As of our second improvement, we believe that collecting the data in a controlled setting (e.g. hospital) for a long period of time is highly beneficial because this can reduce confounding variables. Also by collecting the data over time, we will be able to see the trend over time and this will help with the accuracy in our analysis. 

Our analysis shows that certain factors are highly associated with heart disease. These associations can potentially be used as a diagnostic tools to diagnose or predict heart disease in patients. Therefore, this powerful method can save many lives and have many useful biomedical applications.

## References
Detrano, Robert, M.D., Ph.D. University of California - Irvine Machine Learning Database. July 1988. Raw data. V.A. Medical Center, Long Beach and Cleveland Clinic Foundation, Long Beach, Cleveland.

Eyler, Amy A. Environmental, Policy, and Cultural Factors Related to Physical Activity in a Diverse Sample of Women: The Women's Cardiovascular Health Network Project. New York: Haworth Medical, 2002. Print.

Spacey, John. "Morning Radio Workouts in Japan: Bring on the Pain." Japan Talk. Japan Talk, 14 Aug. 2012. Web. 26 Apr. 2016.
