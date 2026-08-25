
  bend_3pt_cyclic_TimeForce <- function(data, length, cycles, userPts, maxExt){
    #pracma package required for trapz
    
    #data$Load <- abs(data$Load)
    h = sqrt((length/2)^2 + abs(maxExt^2))
    Angle = rad2deg(asin(maxExt * (sin(90)/h)))
    
    cycleList = list()
    #Data Subsets
    for (i in 1:cycles){
      start = which.min(abs(data$Time - userPts[i]))
      end = which.min(abs(data$Time - userPts[i+1]))
      cycleList[[i]] = as.data.frame(assign(paste0("cycle",i), data[c(start:end),]))
    }
    
    for (i in 1:cycles){
      cycle = as.data.frame(cycleList[i])
      
      cycleMaxIndex  <- which.max(cycle$Load)
      #cycleMaxExt    <- cycle$Extension[cycleMaxIndex]
      dataToMaxLoad = data[c(1:cycleMaxIndex),]
      dataToMaxLoad$Extension <- ppoints(nrow(dataToMaxLoad),1)*5
      
      #cycleMaxAngle  <- cycle$Angle[cycleMaxIndex]
      cycleMaxLoad   <- cycle$Load[cycleMaxIndex]
      cycleWork <- trapz(dataToMaxLoad$Extension, dataToMaxLoad$Load)
      
      assign(paste0("cycle",i,"MaxIndex"), cycleMaxIndex)
      #assign(paste0("cycle",i,"MaxExt"), cycleMaxExt)
      #assign(paste0("cycle",i,"MaxAngle"), cycleMaxAngle)
      assign(paste0("cycle",i,"MaxLoad"), cycleMaxLoad)
      assign(paste0("cycle",i,"Work"), cycleWork)
      
    }
    
    toPlot01 = cycles
    toPlot02 = cycleList
    
    rm(cycles, cycle, cycleMaxLoad, cycleWork, cycle4, cycle5,
       cycle1, cycle2, cycle3, cycleMaxIndex, cycleList, dataToMaxLoad)
    
    all_variables = ls()
    matching_variables <- grep(".*cycle.*", all_variables, value = TRUE)
    
    all_values = list()
    for (variable_name in matching_variables) {
      variable_value <- get(variable_name)
      all_values = c(all_values, variable_value)
    }
    
    all_values = as.data.frame(all_values)
    colnames(all_values) <- matching_variables
    
    ### ALL OF THIS IS JUST PLOTTING
      # Combine all cycles into one data frame with a Cycle label, for plotting
      plot_data <- do.call(rbind, lapply(1:toPlot01, function(i) {
        cycle_df <- as.data.frame(toPlot02[i])
        cycle_df$Cycle <- as.factor(i)
        cycle_df
      }))
      
      # Grab the max load point for each cycle (time + load), to mark separately
      max_points <- do.call(rbind, lapply(1:toPlot01, function(i) {
        cycle_df <- as.data.frame(toPlot02[i])
        maxIdx <- which.max(cycle_df$Load)
        data.frame(
          Time = cycle_df$Time[maxIdx],
          Load = cycle_df$Load[maxIdx],
          Cycle = as.factor(i)
        )
      }))
      
      p_cycles <- ggplot(plot_data, aes(x = Time, y = Load, color = Cycle)) +
        geom_line() +
        geom_point(data = max_points, aes(x = Time, y = Load, color = Cycle), size = 3) +
        labs(title = "Load over Time by Cycle, with Max Load Marked",
             x = "Time", y = "Load") +
        theme_classic()
    
    return(list(results = all_values, plot = p_cycles))
  }
  