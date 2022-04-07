---
layout: post
title:  "TIL, 2022-04-06, Front-end component design principles"
date:   2022-04-06 11:32:15 +0800
categories: programming
summary: "Front-end component design principles"
---

# Contemporary Front-end Architectures
[Reference](https://blog.webf.zone/contemporary-front-end-architectures-fb5b500b0231)

- Reasoning about the Data Flows within different components of a software system is the central idea of software architecture.
- *The struggle of software architecture is to provide reasonable means to compose the software without losing sanity.*

# Front end component design principles
[Reference](https://engineering.carsguide.com.au/front-end-component-design-principles-55c5963998c9)

- Component - a collection of markup, with potentially some logic and usually some styling.
- Hierarchy and class diagrams: State, props, methods, relationships to other components.
- When you have a general idea of how to build a component:
  - An easy to understand view of component composition and association.
  - An easy to understand overview of your application UI hierarchy.
  - A view of your hierarchy's data and how it flows.
  - The component responsibility.
- Flat, data-oriented state/props: `<ListItem phone={customer.phone} name={customer.name} idNumber={customer.id} />` vs `<ListItem customer={customer} />`. Don't store entire components in the state/props and render straight from there.
- State change purity: Changes to state should be in response to some kind of event, like the user clicking a button, or an API response returning. State changes should be free of side effects.
  - Event handler for paging should change the page value and trigger the API call.
- Loose coupling:
  - How much a components' functionality relies on its parent and the props it's passed, and what children it renders.
  - *Tightly coupled components tend to be more work to reuse, don't function properly when not children of their original parent component, have a child or children that only make sense in their original context, and lead to code duplication as they are over-fitted to their original use case.*
- Code separation:
  - Separating out auxiliary code into into its own file so no need to deal in the component: Configuration, dummy data, non-technical documentation.
- View distillation:
  -  Make the components contain the bare minimum JS needed to render them. Everything extraneous, like data fetching, data munging, or event handling logic should ideally be made generic and moved into external scripts.
  - *JS is only to help render the view, with maybe a little extra logic specific to that component (i.e. used nowhere else). Anything beyond that, like API calls, non-specific formatting of values can be moved to external scripts.*
- Timely modularisation - when and why?
  - Is there enough markup/logic to warrant it?
  - Is the code repeated/likely to be repeated?
  - Would it reduce boilerplate?
  - Is performance suffering? (Changing state/props causes re-rendering).
  - Are you having trouble testing all parts of your code?
  - Think about what exactly it achieves - does this allow for looser coupling? Is the chunk I'm breaking off logically making sense to be on its own?
  - Do the benefits outweigh the cost?
- Centralised store tools like Redux/Vuex/React's Context API.
  - Think about if the props come not from the parent but from the store.

# Buying Bathroom Tiles

- Design vision of the room
- Glaze tiles which reflect light or glass mosaic tiles.
- Material:
  - Ceramic is inexpensive and easy to work with.
  - Porcelain: Resistant to water damage.
  - Stone tiles: Natural patterns and are hard-wearing.
- Recommend unglazed tiles for the floor so they are not slippery.
- Recommend to buy more tiles than needed to account for breakage.
- Tile grading.
- Store tiles to cover for unexpected repairs/replacements.
- Tile sizes - smaller tiles mean more grout lines and can make the space look busy.
- Order a swatch sample or a full tile sample.
- Sealing tiles.

# Why You Need Grout When You Install Tile and Stone
[Reference](https://www.tileoutlets.com/blog/why-you-need-grout-when-you-install-tile-and-stone/)

- Filer for the joints between the tiles - cement, lime, color pigment, and sand that hardens when mixed with water and left to cure.
  - Gives wall a finished appearance.
  - Keeps dirt/debris from getting in between you and under your tile.
  - Add rigidity/strength to tile installation.
- Non-sanded: 1/8 inch or less. Sanded - 1/8 inch or greater. Sand gives durability.
- Grout color: Monochromatic or dichromatic with the tile.
- Peanut butter consistency.
- Excessive water in the sponge is bad.
- Change grout water.
- Let grout cure for 45 minutes to 2 hours.
- Seal the grout.

# The Complete Guide to Bathroom Tile
[Reference](https://whytile.com/2018/07/complete-guide-bathroom-tile/)

- Ceramic tile: anti-slip features to choose the right kind of tile for your bathroom.
- Water resistance: Ceramic tiles floor or wall is waterproof vs water.
- Healthy environment: No allergens, no volatile organic compounds, no formaldehyde, no PVC, no plastic.

# Bathroom Cleaners
[Reference](https://www.goodhousekeeping.com/home-products/a19008/best-bathroom-cleaners/)

- Cleaner/sanitizing spray
- Clorox Toilet bowl cleaner with Bleach
- Bath Scrubber
- Tilex Mold/Mildew Remover
- Brilliant Bath Grout Cleaner
- Wet Mopping Cloths
- Lysol Wipes
- Breather Bathroom Cleaner
- Gloves
