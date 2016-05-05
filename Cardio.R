raw <- read.csv("C:/Users/dkaing/Desktop/cleveland.txt", header=FALSE)
ProcessedData <- data.frame()
row <- 1
col <- 0
for(i in 1:nrow(raw)){
    	rawString <- toString(raw[i,])
    	splitString <- strsplit(rawString, " ")
    	for(j in 1:length(splitString[[1]])){
            if(splitString[[1]][j] == "name"){
                    d <- "name"
                    col <- col + 1
                    ProcessedData[row, col] <- d
                    row <- 1+row
                    col <- 0
                   	 
            }else{
                    d <- as.numeric(splitString[[1]][j])
                    col <- col + 1
                    ProcessedData[row,col] <- d
            }
    	}
   	 
}

ProcessedData <- ProcessedData[1:282,1:76]
colnames(ProcessedData) <- c("id", "ccf", "age", "sex", "painloc", "painexer", "relrest", "pncaden", "cp", "trestbps", "htn", "chol", "smoke", "cigs", "years", "fbs", "dm", "Famhist", "restecg", "ekgmo", "ekgday", "ekgyr", "dig", "prop", "nitr", "pro", "diuretic", "proto", "thaldur", "thaltime", "met", "thalach", "thalrest", "tpeakbps", "tpeakbpd", "dummy", "trestbpd", "exang", "xhypo", "oldpeak", "slope", "rldv5", "rldv5e", "ca", "restckm", "exerckm", "restef", "restwm", "exeref", "exerwm", "thal", "thalsev", "thalpul", "earlobe", "cmo", "cday", "cyr", "num", "lmt", "ladprox", "laddist", "diag", "cxmain", "ramus", "om1", "om2", "rcaprox", "rcadist", "lvx1", "lvx2", "lvx3", "lvx4", "lvf", "cathef", "junk", "name")

ProcessedData$sex[ProcessedData$sex == 1] <- "Male"
ProcessedData$sex[ProcessedData$sex == 0] <- "Female"
T1 <- table(ProcessedData$exang, ProcessedData$sex)
proptable <- prop.table(table( ProcessedData$exang,ProcessedData$sex), 2)

par(mar = c(3, 4.1, 2, 9), xpd = T)
barplot(proptable, col = c("darkgray", "darkred"), axes = F, font = 2, ylim = c(0, 1.3))
legend("top", legend = c("Exercise Induced Angina", "Not Exercise Induced Angina" ), fill = c("darkred", "darkgray"), cex = 0.5)
axis(2,at = seq(0, 1, by = 0.1), col = "darkgray", font = 2, las = 2)
mtext("Frequency", side = 2, font = 2, line = 3)

dev.copy(png, "boxplot.png")
dev.off()

prop.test(T1, alternative = "greater", conf.level = 0.95)

typical_angina <- ProcessedData[ProcessedData$cp == 1, ]
atypical_angina <- ProcessedData[ProcessedData$cp == 2, ]
typical_angina$type <- "Typical Angina"
atypical_angina$type <- "Atypical Angina"
angina <- rbind(typical_angina, atypical_angina)

ggplot(angina, aes(x = type, y = trestbps, fill = type))+geom_boxplot()+xlab("Type of Angina")+ylab("Resting Blood Pressure (mm Hg)")
dev.copy(png, "angina.png")
dev.off()
dev.copy(pdf, "angina.pdf", width = 11, height = 8)
dev.off()


t.test(as.numeric(atypical_angina$trestbps),as.numeric(typical_angina$trestbps), "less")

ProcessedData$age <- as.numeric(ProcessedData$age)

plot(ProcessedData$age, ProcessedData$thalach, type = "p", pch = 16, col = "darkred", xlab = "", ylab = "", ylim = c(70,220), xlim = c(29,77), axes = F)
axis(2, at = seq(70, 220, by = 20), col = "darkgray", font = 2)
axis(1, at = seq(29, 77, by = 4 ), col = "darkgray", font = 2)
mtext("Age of Patients (years)", side = 1, font = 2, line = 3)
mtext("Maximum Heart Rate Achieved after Exercise (bpm)", side = 2, font = 2, line = 3)

ggplot(ProcessedData, aes( x = age, y = thalach))+geom_point(colour = "darkred")+xlab("Age of Patients (Years)")+ylab("Maximum Heart Rate Achieved (bpm)")
dev.copy(png, "age_hr.png")
dev.off()

dev.copy(pdf, "age_hr.pdf", width = 11, height = 8)
dev.off()
ggplot(ProcessedData, aes( x = age, y = thalach))+geom_point(colour = "darkred")+geom_smooth(method = "lm", se = F)+xlab("Age of Patients (Years)")+ylab("Maximum Heart Rate Achieved (bpm)")
dev.copy(png, "age_hr_best_fit.png")
dev.off()
dev.copy(pdf, "age_hr_best_fit.pdf", width = 11, height = 8)
dev.off()


model <- lm(thalach~age, data = ProcessedData)
summary(model)
abline(model, lwd = 2)

dev.off()


