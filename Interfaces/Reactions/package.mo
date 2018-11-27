within GenKinetics.Interfaces;
package Reactions "Interfaces for Reactions"
extends Modelica.Icons.BasesPackage;

annotation (Documentation(info="<html>
<h4><span style=\"color: #008c48\">Reactions </span></h4>
<p><br>From Biochem:</p>
<p>This package contains partial reaction models that can be used as templates when composing new reactions. In fact all reactions found in the Reactions are based on these partial reaction models. All reactions need at least one substrate and at least one product. This package contains base classes for any combination of substrates and products for reversible as well as irreversible reactions. The first letter in the reaction name indicates the number of substrates, and the second the number of products. Finally, the third letter indicates if the reaction is reversible (r) or irreversible (i). </p>
<p>In GenKinetics, the structure of some  kinetic laws don&apos;t reflect the reversibility of a reaction and therefore a third letter is not obligatory.   </p>
</html>"));
end Reactions;
