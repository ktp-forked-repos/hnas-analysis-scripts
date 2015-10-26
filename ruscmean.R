ruscmean <- function(filelist, users, metrics){
        result <- data.frame(row.names = metrics)
        for(i in 1:length(filelist)){
                data <- read.csv(filelist[i],colClasses = "character")
                for(x in 1:length(metrics)){
                        result[x,i] <- round(mean(as.numeric(data[[metrics[x]]])), 3)
                }
        }
        colnames(result) <- users
        result
}

bl <- c("Baseline_900users.csv", "Baseline_1200users.csv", "Baseline_1800users.csv", "Baseline_2400users.csv", "Baseline_2997users.csv")
fabl <- c("FileAudit_Baseline_900users.csv", "FileAudit_Baseline_1200users.csv", "FileAudit_Baseline_1800users.csv", "FileAudit_Baseline_2400users.csv", "FileAudit_Baseline_2997users.csv")
difa <- c("DI_FileAudit_900users.csv", "DI_FileAudit_1200users.csv", "DI_FileAudit_1800users.csv", "DI_FileAudit_2400users.csv", "DI_FileAudit_2997users.csv")
disc <- c("DI_ScanningOnly_900.csv", "DI_ScanningOnly_1200.csv", "DI_ScanningOnly_1800.csv", "DI_ScanningOnly_2400.csv", "DI_ScanningOnly_2997.csv")
difasc <- c("DI_FileAuditScanning_900users.csv", "DI_FileAuditScanning_1200users.csv", "DI_FileAuditScanning_1800users.csv", "FileAudit_Baseline_2400users.csv", "FileAudit_Baseline_2997users.csv")

users <- c("900 users", "1200 users", "1800 users", "2400 users", "3000 users")
metrics <- c("SMB2.Ops.sec", "VSPfs00.Ops.sec", "VSPfs00.CIFS.Read.Resp.Time", "VSPfs00.CIFS.Write.Resp.Time", "MFB", "MMB", "NibRX.Busy", "NibTX.Busy", 
             "NibTCP.Busy", "NICC.Busy", "FDP.Busy", "TDP.Busy", "FSA.Busy", "MBI.Busy", "WDIR.Busy", "WFILE.Busy", "WLOG.Busy", "OBJ.Busy", "SI.Busy", "Eth.RX", 
             "Eth.TX", "FC.RX", "FC.TX", "Port1.Disk.Read", "Port1.Disk.Write", "Port2.Disk.Read", "Port2.Disk.Write", "Port3.Disk.Read", "Port3.Disk.Write",
             "Port4.Disk.Read", "Port4.Disk.Write")

write.csv(ruscmean(bl, users, metrics), file = "Baseline_summary.csv")
write.csv(ruscmean(fabl, users, metrics), file = "FileAudit_Baseline_summary.csv")
write.csv(ruscmean(difa, users, metrics), file = "DI_FileAudit_summary.csv")
write.csv(ruscmean(disc, users, metrics), file = "DI_ScanningOnly_summary.csv")
write.csv(ruscmean(difasc, users, metrics), file = "DI_FileAuditScanning_summary.csv")


##########################
# Notes
##########################
# data <- read.csv(filename, colClasses = "character")
# files <- c("Baseline_900users.csv", "Baseline_1200users.csv", "Baseline_1800users.csv", "Baseline_2400users.csv", "Baseline_2997users.csv")
# users <- c("900", "1200", "1800", "2400", "3000")
# metrics <-colnames(data)
# metrics <- c("SMB2.Ops.sec", "VSPfs00.Ops.sec", "VSPfs00.CIFS.Read.Resp.Time", "VSPfs00.CIFS.Write.Resp.Time", "MFB", "MMB", "NibRX.Busy", "NibTX.Busy", 
#              "NibTCP.Busy", "NICC.Busy", "FDP.Busy", "TDP.Busy", "FSA.Busy", "MBI.Busy", "WDIR.Busy", "WFILE.Busy", "WLOG.Busy", "OBJ.Busy", "SI.Busy", "Eth.RX", 
#              "Eth.TX", "FC.RX", "FC.TX", "Port1.Disk.Read", "Port1.Disk.Write", "Port2.Disk.Read", "Port2.Disk.Write", "Port3.Disk.Read", "Port3.Disk.Write",
#              "Port4.Disk.Read", "Port4.Disk.Write")
#
# ruscproc(files, users, metrics)
