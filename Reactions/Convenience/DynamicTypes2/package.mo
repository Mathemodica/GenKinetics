within GenKinetics.Reactions.Convenience;
package DynamicTypes2 "Re-implementation of the package DynamicType"
  extends Modelica.Icons.VariantsPackage;

  model IrrUniUni
    extends GenKinetics.Reactions.Convenience.Dynamic.IrrKinetic(NS = 1, NP = 1);
  end IrrUniUni;

  model IrrUniUniI1
    extends GenKinetics.Reactions.Convenience.Dynamic.InhIrrKinetic(NS=1,NP=1,NI=1);
  end IrrUniUniI1;

  model RevUniUni
    extends GenKinetics.Reactions.Convenience.Dynamic.RevKinetic(NS=1,NP=1);
  end RevUniUni;

  model IrrBiUni
    extends GenKinetics.Reactions.Convenience.Dynamic.IrrKinetic(NS=2,NP=1);
  end IrrBiUni;

  model IrrUniBiI1
    extends GenKinetics.Reactions.Convenience.Dynamic.InhIrrKinetic(NS=1,NP=2,NI=1);
  end IrrUniBiI1;








end DynamicTypes2;
