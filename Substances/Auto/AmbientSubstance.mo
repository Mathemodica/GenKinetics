within GenKinetics.Substances.Auto;
model AmbientSubstance "Metabolite with fixed concentration"
  extends GenKinetics.Substances.Auto.BasicSubstance;
equation
  c = c_0;
end AmbientSubstance;
