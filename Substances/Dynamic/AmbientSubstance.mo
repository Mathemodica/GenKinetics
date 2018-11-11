within GenKinetics.Substances.Dynamic;
model AmbientSubstance "Metabolite with fixed concentration"
  extends GenKinetics.Substances.Dynamic.BasicSubstance;
equation
  c = c_0;
end AmbientSubstance;
