import { CheckboxInput, Feature, FeatureChoicedServerData, FeatureToggle, FeatureDropdownInput, FeatureValueProps } from "../base";
import { useBackend } from "../../../../../backend";
import { PreferencesMenuData } from "../../../data";

export const donor_hat: Feature<string> = {
  name: "Donor hat",
  category: "DONATOR",
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
    context,
  ) => {
    const { data } = useBackend<PreferencesMenuData>(context);

    return (<FeatureDropdownInput
      {...props}
      disabled={!data.content_unlocked}
    />);
  },
};

export const donor_item: Feature<string> = {
  name: "Donor item",
  category: "DONATOR",
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
    context,
  ) => {
    const { data } = useBackend<PreferencesMenuData>(context);

    return (<FeatureDropdownInput
      {...props}
      disabled={!data.content_unlocked}
    />);
  },
};

export const borg_hat: FeatureToggle = {
  name: "Equip borg hat",
  category: "DONATOR",
  description: "When enabled, you will equip your selected donor hat when playing cyborg.",
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
    context,
  ) => {
    const { data } = useBackend<PreferencesMenuData>(context);

    return (<CheckboxInput
      {...props}
      disabled={!data.content_unlocked}
    />);
  },
};

export const donor_pda: Feature<string> = {
  name: "Donor PDA",
  category: "DONATOR",
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
    context,
  ) => {
    const { data } = useBackend<PreferencesMenuData>(context);

    return (<FeatureDropdownInput
      {...props}
      disabled={!data.content_unlocked}
    />);
  },
};

export const purrbation: FeatureToggle = {
  name: "Purrbation",
  category: "DONATOR",
  description: "When enabled and you are human, you will turn you into a felinid.",
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
    context,
  ) => {
    const { data } = useBackend<PreferencesMenuData>(context);

    return (<CheckboxInput
      {...props}
      disabled={!data.content_unlocked}
    />);
  },
};
