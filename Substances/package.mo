within GenKinetics;
package Substances
  extends Modelica.Icons.Package;

  annotation (
    Documentation(info="<html>
<p><b><span style=\"font-size: 14pt;\">Substances </span></b></p>
<p>From BioChem:</p>
<p>This package contains different types of nodes needed for representing a substance in a biochemical pathway. Substances are connected to reactions through connectors placed on the rim of the circle representing the substance.</p>
<p>The substance models are specified by extending the partial models of substance nodes in Substances and adding additional attributes and equations. The Substances model is used when the concentration in a substance node is allowed to change without restrictions during a simulation, while BoundarySubstances is used when the concentration can only be changed using events. This correspond to species with the fixed or boundary attribute set in SBML.</p>
<p>The AmbientSubstance is a substance used as a reservoir in reactions. This corresponds to the empty list of reactants or the empty list of products in an SBML reaction. When the concentration is not determined by reactions, the SignalSubstance model is used. Then the substance concentration is regulated by external equations, and it corresponds to SBML species changed by any SBML rules. </p>
<p><br><h4>GenKinetics Note:</h4></p>
<p>This subpackage contains components for chemical substances. Additional substances (e.g. BoundarySubstance or SingleSubstance) are also provided in other implementations of the Biochem library. </p>
</html>"));
end Substances;
