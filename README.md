# ⚡️ Probabilistic Analysis of the Optimization Schedule of Electric Vehicles on Power Distribution Grids
## Project Overview
This project provides an in-depth analysis of the impact of growing fleets of Electric Vehicles (EVs) on power distribution grids. The primary objective is to evaluate how uncoordinated EV charging can affect grid stability, focusing on critical parameters such as voltage regulation and transformer loading.

The methodology is divided into two main parts:

A Monte Carlo Simulation to model the probabilistic behavior of EV charging.

The validation of optimization algorithms (Genetic Algorithms and Ant Colony Optimization) to demonstrate their applicability in solving complex engineering problems.

This work was developed as a final undergraduate thesis in Electrical Engineering at the Federal University of Ouro Preto (UFOP).

## Methodology
1. EV Charging Simulation
A Monte Carlo Simulation was implemented to model EV charging behavior based on probabilistic variables like vehicle arrival time, initial State of Charge (SoC), and distance driven. The simulation was conducted on an IEEE 34-bus distribution network to analyze the effects of charging under different EV penetration scenarios (20%, 40%, and 60% of the total fleet).

2. Optimization Algorithm Validation
To validate potential tools for smart charging management, two metaheuristic algorithms were implemented and compared on the Traveling Salesman Problem (TSP):

      * Genetic Algorithm (GA): Inspired by Darwin's theory of evolution.

      * Ant Colony Optimization (ACO): Based on the foraging behavior of ants.

      Both algorithms proved effective in finding optimal solutions for the TSP.

## Results and Conclusions

### Impact on the Distribution Grid
- **Voltage Violations:** The simulation showed that at 60% EV penetration with uncoordinated fast charging, the grid experiences voltage drops below the minimum of 0.93 p.u.
- **Transformer Overloading:** The same scenario resulted in the main network transformer exceeding its nominal capacity.

The study concludes that uncoordinated EV charging poses a real risk to grid stability, highlighting the urgent need for smart charging strategies to manage demand and avoid significant infrastructure investments.

### Optimization Algorithm Performance
- The Genetic Algorithm showed superior convergence and found a more optimal solution than the Ant Colony Optimization for the tested parameters.


## Technologies Used
Simulation Software: MATLAB (version 2018a)

Algorithms: Monte Carlo Simulation, Genetic Algorithms (GA), Ant Colony Optimization (ACO)

Test System: IEEE 34-bus network

