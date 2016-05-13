@NavigationTabs = React.createClass
  getInitialState: ->
    navigation_tabs: @props.navigation_tabs

  render: ->
    React.DOM.div
      className: 'navigation_tabs'
      React.createElement Tabs, { tabsList: @props.navigation_tabs }


@Tabs = React.createClass
  render: ->
    React.DOM.nav
      className: 'tabs'
      React.DOM.ul
        @props.tabsList.map (tab) =>
          React.createElement Tab, { id: tab.id, url: tab.url, name: tab.name }

@Tab = React.createClass
  render: ->
    React.DOM.li
      className: 'tab' + @props.id
      React.DOM.a
        href: @props.url
        @props.name
