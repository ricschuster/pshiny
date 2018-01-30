#add objective  
if (input$objective == "min_set"){
  p <- p %>% add_min_set_objective()
  
} else if (input$objective == "max_cov"){
  p <- p %>% add_max_cover_objective(input$budget)
  
} else if (input$objective == "max_feat"){
  p <- p %>% add_max_features_objective(input$budget)
  
} else if (input$objective == "max_phylo"){
  p <- p %>% add_max_phylo_objective(input$budget, input$phylo)
  
} else if (input$objective == "max_util"){
  p <- p %>% add_max_utility_objective(input$budget)
  
} #else{
#Throw error or show warning
#}


#add targets
if (input$objective %in% c("min_set", "max_feat", "max_phylo")){
  
  if(input$glob_tar == "global"){
    tmp_tar <- input$tar_all
  } else {
    tmp_tar <- 1 #get target values from rhandsontable
  }
  
  if(input$tar_type == "rel_tar"){
    p <- p %>% add_relative_targets(tmp_tar)
    
  } else if(input$tar_type == "abs_tar"){
    p <- p %>% add_relative_targets(tmp_tar)
    
  } else if(input$tar_type == "log_tar"){
    p <- p %>% add_loglinear_targets(tmp_tar)
    
  }
}
