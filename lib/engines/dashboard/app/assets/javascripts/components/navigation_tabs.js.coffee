@NavigationTabs = React.createClass
  getInitialState: ->
    navigation_tabs: @props.navigation_tabs

  render: ->
    React.DOM.div
      className: 'navigation_tabs'
      React.createElement Tabs, { tabsList: @props.navigation_tabs }

@Tabs = React.createClass
  render: ->
    React.DOM.nav null,
      React.DOM.ul
        className: 'nav nav-tabs'
        @props.tabsList.map (tab) =>
          React.createElement Tab, { id: tab.id, url: tab.url, name: tab.name }
      React.DOM.div
        className: 'tab-content'
        @props.tabsList.map (tab) =>
          React.DOM.div
            id: tab.url
            className: 'tab-pane fade'
            React.DOM.p
              'Some content for' + tab.name

@Tab = React.createClass
  render: ->
    React.DOM.li null,
      React.DOM.a
        'data-toggle': 'tab'
        href: "#" + @props.url
        @props.name