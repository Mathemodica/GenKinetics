within GenKinetics.Substances;
model AmbientSubstance "Metabolite with fixed concentration"
  import GenKinetics;
  extends GenKinetics.Substances.BasicSubstance;
equation
  c = c_0;
end AmbientSubstance;
