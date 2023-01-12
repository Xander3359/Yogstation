import { FeatureToggle, CheckboxInput, CheckboxInputInverse } from "../base";

export const quiet_mode: FeatureToggle = {
  name: "Quiet mode",
  category: "DONATOR",
  description: "You cannot be chosen as an antogonist or antagonist target.",
  component: CheckboxInput,
};

export const pref_mood: FeatureToggle = {
  name: "Enable mood",
  category: "GAMEPLAY",
  description: "Enable the mood system.",
  component: CheckboxInput,
};
