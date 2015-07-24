# Coursera Exploratory Data Analysis course project 2

## Introduction

This assignment required students to analyse data from the [National Emissions Inventory](http://www.epa.gov/ttn/chief/eiinformation.html) (EMI) over a course of 10 years. The EMI is published by the Environmental Protection Agency (EPA) in the United States.

More specifically, the assignemnt requires the student author an R program that produces a plot for each of the following questions:

1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the **base** plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

2. Have total emissions from PM2.5 decreased in the **Baltimore City**, Maryland (`fips == "24510"`) from 1999 to 2008? Use the **base** plotting system to make a plot answering this question.

3. Of the four types of sources indicated by the `type` (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for **Baltimore City**? Which have seen increases in emissions from 1999–2008? Use the **ggplot2** plotting system to make a plot answer this question.

4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

5. How have emissions from motor vehicle sources changed from 1999–2008 in **Baltimore City**?

6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in **Los Angeles County**, California (`fips == "06037"`). Which city has seen greater changes over time in motor vehicle emissions?

## Usage

There is a set of six programs that each generates a plot:

1. `source("./plot1.R")` produces `plot1.png`
2. `source("./plot2.R")` produces `plot2.png`
3. `source("./plot3.R")` produces `plot3.png`
4. `source("./plot4.R")` produces `plot4.png`
5. `source("./plot5.R")` produces `plot5.png`
6. `source("./plot6.R")` produces `plot6.png`

`prepare_data.R` is a utility program that downloads and prepares the data. All six of the above programs use it.

Run `source("./generate_plots.R")` to generate all plots.