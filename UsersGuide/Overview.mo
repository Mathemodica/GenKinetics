within GenKinetics.UsersGuide;

class Overview
  extends Modelica.Icons.Information;
  annotation(
    Documentation(info = "<html>
<h4><span style=\"color: #008000\">About</span></h4>
<p><br><i>GenKinetics</i> contains an implementation of a specific set of reaction kinetics, namely, generalized simplified kinetic formats. It follows many of the guidelines recommended by the <a href=\"https://github.com/OpenModelica/BioChem\">Biochem library</a>. The underlying simplified kinetics formats are represented by generalized structured kinetics formulas suitable for arbitrary biochemical reactions with arbitrary number of substrates, products, inhibitors and activators. In this way, matabolic reaction networks can be easily assembled using a few number of reaction kinetics.</p>
<p><br><b><span style=\"color: #008000;\">Structure of the Library</span></b></p>
<p><br>The following packages are available: </p>
<ul>
<li><i>Icons</i>: icons </li>
<li><i>Units</i>: physical units </li>
<li><i>Interfaces</i>: connectors, interfaces and abstract classes </li>
<li>Substances: components for metabolites </li>
<li><i>Reactions</i>: interfaces and components for reactions</li>
<li><i>Examples</i>: biochemical network models</li>
<li><i>UnitTests</i>: unit tests for single components&nbsp;</li>
</ul>
<h4><span style=\"color: #008000\">Connections</span></h4>
<p><br>That is concentration of a substance is the potential variable while the flow rate of materials (i.e. the chemical transformation process) represents the flow variables when connecting nodes and reactions together, cf. <i><a href=\"modelica://GenKinetics.Interfaces.Nodes.ChemicalPort\">GenKinetics.Interfaces.Nodes.ChemicalPort</a></i>. Further subtypes of connectors exist: </p>
<ul>
<li><i><a href=\"
GenKinetics.Intefaces.Nodes.SubstrateConnector\">GenKinetics.Intefaces.Nodes.SubstrateConnector</a> </i>: for reactions from the substrate side</li>
<li><i><a href=\"modelica://GenKinetics.Interfaces.Nodes.ProductConnector\">GenKinetics.Interfaces.Nodes.ProductConnector</a> </i>: for reactions from the product side</li>
<li><i><a href=\"
modelica://GenKinetics.Interfaces.Nodes.ModifierChemicalPort\">GenKinetics.Interfaces.Nodes.ModifierConnector</a> </i>: connecting reactions and effector nodes</li>
<li><i><a href=\"
modelica://GenKinetics.Interfaces.Nodes.InhibitorConnector\">GenKinetics.Interfaces.Nodes.InhibitorConnector</a> </i>: for inhibiting reactions</li>
<li><i><a href=\"modelica://GenKinetics.Interfaces.Nodes.ActivatorConnector\">GenKinetics.Interfaces.Nodes.ActivatorConnector </a></i>: for activating reactions<br></li>
</ul>
<h4><span style=\"color: #008000\">Interfaces and abstract classes</span></h4>
<p><br>Further interfaces and abstract classes are used within implemented reactions for simplifying their implementations and emphasizing their classification. The most important of which are: </p>
<p><i><a href=\"modelica://GenKinetics.Interfaces.Reversible.ReactionReversibility\">GenKinetics.Interfaces.Reversible.ReactionReversibility</a></i>: for determining the reversibility of reactions. The extended interfaces OneWay, TwoWay are used for irreversible, reversible reactions, respectively:</p>
<ul>
<li><i><a href=\"
modelica://GenKinetics.Interfaces.Substances.SubstanceConnections\">GenKinetics.Interfaces.Substances.SubstanceConnections</a></i>: fixed number of connections for nodes</li>
<li><i><a href=\"
modelica://GenKinetics.Interfaces.Dynamic.NodeConnections\">GenKinetics.Interfaces.Substances.Auto.SubstanceConnections</a></i>: more suitable for automatically generated models or textual modeling not using GUI </li>
<li><i><a href=\"
modelica://GenKinetics.Interfaces.Dynamic.Dimension.ReactionDimension\">GenKinetics.Interfaces.Reactions.Basic..Auto.Dimension.ReactionDimension</a></i>: parameterized number of connections for nodes. This interface can be used for specializing further classes of specific dimension, e.g. <i><a href=\"
modelica://GenKinetics.Interfaces.Dynamic.Dimension.ReactionDimension\">GenKinetics.Interfaces.Reactions.Basic.Auto.Dimension.UniUni</a> .</i> </li>
<li><i><a href=\"modelica://GenKinetics.Interfaces.Reactions\">GenKinetics.Interfaces.Reactions.*</a>. : </i>Interfaces for reactions of specific structure.</li>
</ul>
<h4><span style=\"color: #008000\">Icons</span></h4>
<p>Package containing icons employed across the library.</p>
<h4><span style=\"color: #008000\">Nodes</span></h4>
<p>Typically, the component <i><a href=\"modelica://GenKinetics.Substances.Auto.Substance\">GenKinetics.Substances.Auto.Substance</a></i> or <i><a href=\"modelica://GenKinetics.Substances.Substance\">GenKinetics.Substances.Substance</a> </i>is the basic one needed for constructing biochemical reaction networks. Further types can be also imported from available implementation of the Biochem library. </p>
<h4><span style=\"color: #008000\">Reactions </span></h4>
<p><br>Reaction kinetics are available in the packages<i><a href=\" GenKinetics.Reactions.convenience.\"> </a><a href=\"modelica://GenKinetics.Reactions.Convenience\">GenKinetics.Reactions.Convenience.</a><a href=\" GenKinetics.Reactions.convenience\">*</a></i>. </p>
<p><br>For instance,<i><a href=\" GenKinetics.Reactions.convenience.Dynamic.IrrKinetic\">&nbsp;</a><a href=\"modelica://GenKinetics.Reactions.Convenience.Auto.IrrKinetic\">GenKinetics.Reactions.Convenience.Auto.IrrKinetic</a></i> is used for irreversible reactions with arbitrary number of substrates and products, while <i><a href=\"modelica://GenKinetics.Reactions.Convenience.Auto.IrrKinetic\">GenKinetics.Reactions.Convenience.Auto.InhRevKinetic</a></i> for reversible inhibited reactions with arbitrary number of substrates, products and inhibitors. </p>
<p><br>Static packages provide reaction kinetics with fixed reaction structure. For instance&nbsp;<i><a href=\"GenKinetics.Reactions.Convenience.Explicit.IrrUniBiI1\">GenKinetics.Reactions.Convenience.Explicit.IrrUniBiI1</a></i>. </p>
<h4><span style=\"color: #008000\">UnitTest</span></h4>
<p>Package for unit tests employing XogenyTest library. You can download the library from&nbsp;<a href=\"https://github.com/xogeny/XogenyTest\">https://github.com/xogeny/XogenyTest</a>. Please note if (some) unit tests are not compilable, then please use the newer version of XogenyTest downloadable at&nbsp;<a href=\"https://github.com/AtiyahElsheikh/XogenyTest\">https://github.com/AtiyahElsheikh/XogenyTest</a>.</p>
<h4><span style=\"color: #008000\">Examples</span></h4>
<p>Examples of constructing biochemical networks are given in <i><a href=\"modelica://GenKinetics.Examples.Spirallusdyn\">GenKinetics.Examples.SpirallusDyn</a> and <a href=\"modelica://GenKinetics.Examples.Spirallustatic\">GenKinetics.Examples.SpirallusStatic</a>.</i></p>
</html>"));
end Overview;
