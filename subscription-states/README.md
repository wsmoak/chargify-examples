Chargify Subscription States

Uses GraphViz to generate a directed graph of subscription states.

GraphViz can be installed with HomeBrew:

$ brew install graphviz

The subscription_states.dot file describes the allowed transitions.

To generate the subscription_states.png file:

$ ./build.sh

![Subscription States](https://github.com/wsmoak/chargify/blob/master/subscription-states/subscription_states.png)
