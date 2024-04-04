
# Generate QR code ------------------------------------------------

# install.packages("qrcode")
project_site <- qrcode::qr_code("https://bai-li-noaa.github.io/IFA4EBFM/")
qrcode::generate_svg(project_site, filename = here::here("Presentations", "materials", "project_qr_code.svg"))
jpeg(filename = here::here("Presentations", "materials", "project_qr_code.jpg"))
plot(project_site)
dev.off()

# Workflow --------------------------------------------------------
jpeg(filename = here::here("Presentations", "materials", "workflow.jpg"))
DiagrammeR::mermaid("
graph TB

subgraph Conventional Approach
stock_assessment[Single-species stock assessment] -.Default.-> projections[F- or Catch-based Projections]
end

subgraph Proposed Approach
stock_assessment --> stock_assessment_estimates[Biomass/Spawning biomass estimates]
  subgraph Linear relationships
  stock_assessment_estimates --> environment_regression[Environmental indicator]
  stock_assessment_estimates --> ecology_regression[Ecological indicator]
  stock_assessment_estimates --> economy_regression[Economic indicator]
  end

  subgraph Status of Indicators
  environment_regression -->environment_soi[Environmental condition]
  ecology_regression -->ecology_soi[Ecosystem condition]
  economy_regression -->economy_soi[Economy condition]
  end
end
environment_soi-->|Adjust|projections
ecology_soi-->projections
economy_soi-->projections
environment_soi-->projections
ecology_soi-->projections
economy_soi-->projections

")

dev.off()


DiagrammeR::grViz(
  "digraph {
  graph [layout = dot, rankdir = LR]
  node [shape = rect, style = filled, fillcolor = White, fontsize = 80]
  edge [minlen = 3]

  start [label = <<b>Start</b>>,
         shape = doubleoctagon,
         fillcolor = MistyRose]

  stock_assessment [label = <<b>Single-species Stock Assessment Model</b>,
                  fillcolor = WhiteSmoke]

  projections [label = <<b>Projections</b><br ALIGN = 'LEFT'/><br ALIGN = 'LEFT'/> &#8226; F-based<br ALIGN = 'LEFT'/> &#8226; Catch-based<br ALIGN = 'LEFT'/>]

  linear_regression [label = <<b>Linear Relationships</b><br ALIGN = 'LEFT'/><br ALIGN = 'LEFT'/> &#8226; Biomass/Spawning biomass of key species<br ALIGN = 'LEFT'/> &#8226; Key environmental, ecological and economic indices<br ALIGN = 'LEFT'/>>,
             fillcolor = WhiteSmoke]

  status_of_indicators [label = <<b>Status of Indicators (0-1)</b>>,
             fillcolor = WhiteSmoke]
  default_projection [label = <<b>Default</b>>, shape = plaintext]
  adjusted_projection [label = <<b>Adjust</b>>, shape = plaintext]

  start -> stock_assessment

  edge [arrowhead='none']
  stock_assessment -> default_projection

  edge [arrowhead='normal']
  default_projection -> projections

  stock_assessment -> linear_regression -> status_of_indicators

  edge [arrowhead='none']
  status_of_indicators -> adjusted_projection

  edge [arrowhead='normal']
  adjusted_projection -> projections

}",
  height = 1000,
  width = 1000
)
