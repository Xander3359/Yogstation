import { FeatureColorInput, Feature, FeatureChoiced, FeatureDropdownInput } from "./base";

export const eye_color: Feature<string> = {
  name: "Eye color",
  component: FeatureColorInput,
};

export const facial_hair_color: Feature<string> = {
  name: "Facial hair color",
  component: FeatureColorInput,
};

export const facial_hair_gradient: FeatureChoiced = {
  name: "Facial hair gradient",
  component: FeatureDropdownInput,
};

export const facial_hair_gradient_color: Feature<string> = {
  name: "Facial hair gradient color",
  component: FeatureColorInput,
};

export const hair_color: Feature<string> = {
  name: "Hair color",
  component: FeatureColorInput,
};

export const hair_gradient: FeatureChoiced = {
  name: "Hair gradient",
  component: FeatureDropdownInput,
};

export const hair_gradient_color: Feature<string> = {
  name: "Hair gradient color",
  component: FeatureColorInput,
};


export const feature_human_ears: FeatureChoiced = {
  name: "Ears",
  component: FeatureDropdownInput,
};

export const feature_human_tail: FeatureChoiced = {
  name: "Tail",
  component: FeatureDropdownInput,
};

export const feature_lizard_legs: FeatureChoiced = {
  name: "Legs",
  component: FeatureDropdownInput,
};

export const feature_lizard_spines: FeatureChoiced = {
  name: "Spines",
  component: FeatureDropdownInput,
};

export const feature_lizard_tail: FeatureChoiced = {
  name: "Tail",
  component: FeatureDropdownInput,
};

export const feature_mcolor: Feature<string> = {
  name: "Mutant color",
  component: FeatureColorInput,
};

export const feature_ipc_screen: FeatureChoiced = {
  name: "Screen",
  component: FeatureDropdownInput,
};

export const feature_ipc_antenna: FeatureChoiced = {
  name: "Antenna",
  component: FeatureDropdownInput,
};

export const feature_ipc_chassis: FeatureChoiced = {
  name: "Chassis",
  component: FeatureDropdownInput,
};

export const feature_polysmorph_tail: FeatureChoiced = {
  name: "Tail",
  component: FeatureDropdownInput,
};

export const feature_polysmorph_teeth: FeatureChoiced = {
  name: "Teeth",
  component: FeatureDropdownInput,
};

export const feature_polysmorph_dome: FeatureChoiced = {
  name: "Dome",
  component: FeatureDropdownInput,
};

export const feature_polysmorph_dorsal_tubes: FeatureChoiced = {
  name: "Dorsal tubes",
  component: FeatureDropdownInput,
};

export const feature_pod_hair: FeatureChoiced = {
  name: "Hairstyle",
  component: FeatureDropdownInput,
};

export const feature_pod_hair_color: Feature<string> = {
  name: "Hair color",
  component: FeatureColorInput,
};

export const feature_pod_flower_color: Feature<string> = {
  name: "Flower color",
  component: FeatureColorInput,
};

export const feature_plasmaman_helmet: FeatureChoiced = {
  name: "Helmet style",
  component: FeatureDropdownInput,
};
