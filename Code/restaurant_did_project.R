library(did)

df <- read.csv('restaurant.csv')
View(df)
colnames(df) <- c("index","time", "id", "region", "size", "type", "company", "treat", "first_treat", "outcome")

# did for group treatment effect
df_out <- att_gt(
       tname = "time",
       yname = "outcome",
       idname = "id",
       gname = "first_treat",
       xformla = NULL,
       #xformla = ~region+size+quality+company,
       #xformla = ~region+size+company,
       data = df
   )

# simple aggregation of treatment effect
df_out_simple<-aggte(df_out, type = "simple")
summary(df_out_simple)

#treatment effect by group
df_out_group<-aggte(df_out, type = "group")
ggdid(df_out_group)
#treatment effect by calendar
df_out_calendar<-aggte(df_out, type = "calendar")
ggdid(df_out_calendar)
#treatment effect by dynamic
df_out_dynamic <- aggte(df_out, type = "dynamic")
ggdid(df_out_dynamic)