# constants and updates to make plots look like "Truveta"

#' official color palette
#' @export
official_color_palette <- c(
  "#2F7170",
  "#7999FC",
  "#7E2884",
  "#F74038",
  "#48A194",
  "#5068DA",
  "#F2577F",
  "#FFA000",
  "#B9C1B0",
  "#CDD6E0",
  "#968F96",
  "#FFC800"
)

#' official primary color
#' @export
official_primary_color1 <- "#00C3B4"
#' official blue color
#' @export
official_primary_color2 <- "#3237B4"

.default_width <- getOption("repr.plot.width")
.default_height <- getOption("repr.plot.height")

#'
#' initialized ggplot2 for theme_truveta setting defaults
#' @param figsize optional two numeric vector with c(width, height) in inches
#'
#' @export
initialize_theme_truveta <- \(figsize = NULL) {
  if (!is.null(figsize)) {
    options(repr.plot.width = figsize[1], repr.plot.height = figsize[2])
    options(truveta.plot.width = figsize[1], truveta.plot.height = figsize[2])
  } else {
    options(
      repr.plot.width = .default_width,
      repr.plot.height = .default_height
    )
    options(
      truveta.plot.width = .default_width,
      truveta.plot.height = .default_height
    )
  }
  color <- official_color_palette[1]
  ggplot2::update_geom_defaults("line", list(size = 1.2, color = color))
  ggplot2::update_geom_defaults("bar", list(fill = color))
  ggplot2::update_geom_defaults("col", list(fill = color))
  ggplot2::update_geom_defaults("point", list(fill = color))

  # set default ggplot discrete color scale
  options(
    ggplot2.discrete.fill = official_color_palette,
    ggplot2.discrete.colour = official_color_palette
  )
}

#' ggplot Truveta theme
#' @param figsize optional two numeric vector with c(width, height) in inches
#' @export
theme_truveta <- \(figsize = NULL) {
  if (!is.null(figsize)) {
    options(repr.plot.width = figsize[1], repr.plot.height = figsize[2])
  } else {
    options(
      repr.plot.width = getOption("truveta.plot.width"),
      repr.plot.height = getOption("truveta.plot.height")
    )
  }
  ggplot2::theme_minimal() +
    ggplot2::theme(
      legend.position = "top", legend.justification = "left",
      legend.title = ggplot2::element_blank(),
      text = ggplot2::element_text(size = 12),
      plot.title = ggplot2::element_text(
        size = 16,
        colour = official_primary_color2,
        hjust = 0
      ),
      axis.title.x = ggplot2::element_text(hjust = 1)
    )
}
