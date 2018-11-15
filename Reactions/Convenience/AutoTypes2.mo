within GenKinetics.Reactions.Convenience;
package AutoTypes2 "Re-implementation of the package DynamicType"
  extends Modelica.Icons.VariantsPackage;

  model IrrUniUni
    extends GenKinetics.Reactions.Convenience.Auto.IrrKinetic(   NS = 1, NP = 1);
  end IrrUniUni;

  model IrrUniUniI1
    extends GenKinetics.Reactions.Convenience.Auto.InhIrrKinetic(   NS=1,NP=1,NI=1);
  end IrrUniUniI1;

  model RevUniUni
    extends GenKinetics.Reactions.Convenience.Auto.RevKinetic(   NS=1,NP=1);
  end RevUniUni;

  model IrrBiUni
    extends GenKinetics.Reactions.Convenience.Auto.IrrKinetic(   NS=2,NP=1);
  end IrrBiUni;

  model IrrUniBiI1
    extends GenKinetics.Reactions.Convenience.Auto.InhIrrKinetic(   NS=1,NP=2,NI=1);
  end IrrUniBiI1;

end AutoTypes2;
