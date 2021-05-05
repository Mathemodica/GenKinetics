# GenKinetics

Modeling biochemical reaction networks with generalized kinetic formats 

## Library description

A Modelica library for descriptive modeling of biochemical reaction networks using a specific subset of enzyme kinetics referred to as simplified kinetics formats, e.g. convenience kinetics. These subsets of enzyme kinetics are represented by generalized structured kinetic formulas suitable for biochemical reactions with arbitrary number of substrates, products, inhibitors and activators. By utilizing the power of Modelica constructs for providing a compact implementation of such generalized structured formulas is presented.

![logo](logo.jpg)


#### Release notes

(29.3.2021)  v1.0.2-alpha : MSL 4.0.0 

(22.06.2020) v1.0.1-alpha : starting the progress again, MSL 3.2.3

(7.12.2018)  v1.0-alpha   : Initial implementation containing Biochem-like structure and implementation of Convenience and LinLog kinetics 

#### License

This library can be redistributed and/or modified under the terms of the [Modelica 3 clased BSD License](https://www.modelica.org/licenses/modelica-3-clause-bsd).

## Running the unit tests with OpenModelica OMShell

execute the following commands:

>>>  loadModel(Modelica)

>>>  loadModel(Biochem)

>>>  cd("/path/to/GenKinetics/scripts")

>>>  runScirpt("executeUnitTestsOMC.mos")

## Development and contribution
Main developer: [Atiyah Elsheikh](mailto:Atiyah.Elsheikh@mathemodica.com)

You may report any issues with using the [Issues](../../issues) button.

Contributions in shape of [Pull Requests](../../pulls) are always welcome.

## Financial Support / Sponsorship 

The progress and completion of this library enables another small progress step for Modelica in Systems Biology field. Current plans include: 

- Unifying GenKinetics with [the Biochem Library](https://github.com/OpenModelica/BioChem) 
- Showing examples for switching between mechanistic kinetics and generalized kinetics in a flexible way 
- Establishing a new version of the ADGenKinetics Library that supports the evaluation of dynamic control coefficients 
- Implementing Modelica-based technologies based on dynamic control coefficients 
- among others ... 

Supporting this project via 

- [Paypal](https://www.paypal.com/paypalme/mathemodica) (one time payment)
- [GitHub](https://github.com/sponsors/AtiyahElsheikh) (periodic payment) or 

is appreciable 


