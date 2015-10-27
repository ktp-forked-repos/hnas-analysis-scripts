ruscsummarymerge <-function(filelist, metric){
        cnames <- c("Baseline Read", "File Auditing Read", "DI File Auditing Read", "DI Scaning Read", "DI File Audit and Scan Read",
                    "Baseline Write", "File Auditing Write", "DI File Auditing Write", "DI Scaning Write", "DI File Audit and Scan Write" )
        merged <- c()
        for(h in 1:length(metric)) {
                for(i in 1:length(filelist)) {
                        d <- read.csv(filelist[i],colClasses = "character")
                        merged <- cbind(merged,d[[metric[h]]])
                        
                }
        }
        colnames(merged) <- cnames
        merged
}

u900 <- c("Baseline_900users.csv","FileAudit_Baseline_900users.csv","DI_FileAudit_900users.csv","DI_ScanningOnly_900.csv","DI_FileAuditScanning_900users.csv")
u1200 <- c("Baseline_1200users.csv","FileAudit_Baseline_1200users.csv","DI_FileAudit_1200users.csv","DI_ScanningOnly_1200.csv","DI_FileAuditScanning_1200users.csv")
u1800 <- c("Baseline_1800users.csv","FileAudit_Baseline_1800users.csv","DI_FileAudit_1800users.csv","DI_ScanningOnly_1800.csv","DI_FileAuditScanning_1800users.csv")
u2400 <- c("Baseline_2400users.csv","FileAudit_Baseline_2400users.csv","DI_FileAudit_2400users.csv","DI_ScanningOnly_2400.csv","DI_FileAuditScanning_2400users.csv")
u3000 <- c("Baseline_2997users.csv","FileAudit_Baseline_2997users.csv","DI_FileAudit_2997users.csv","DI_ScanningOnly_2997.csv","DI_FileAuditScanning_2997users.csv")
dlist <- list(u900=u900, u1200=u1200, u1800=u1800, u2400=u2400, u3000=u3000)
metrics <- c("VSPfs00.CIFS.Read.Resp.Time", "VSPfs00.CIFS.Write.Resp.Time")
users <- c("900_users", "1200_users", "1800_users", "2400_users", "3000_users")

for(x in 1:5){
        out<-ruscsummarymerge(as.character(dlist[[x]]), metrics)
        #print(out)
        write.csv(out, file = paste("CIFS_Response_Times_",users[x],"_summary.csv", sep=""))
}

#paste("Severity_Index_", i,".csv", sep="")
