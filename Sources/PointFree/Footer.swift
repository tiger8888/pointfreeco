import Css
import Html
import HtmlCssSupport
import Styleguide
import Prelude

let footerView =
  curry(footer)([`class`([footerClass])]) >>> pure
    <¢> footerInfoColumnsView

private let footerInfoColumnsView =
  pointFreeView.map(gridColumn(sizes: [.mobile: 12, .desktop: 6]) >>> pure)
    <> linksColumnsView
    <> legalView.map(gridColumn(sizes: [.mobile: 12, .desktop: 6]) >>> pure)

private let linksColumnsView =
  contentColumnView.map(gridColumn(sizes: [.mobile: 4, .desktop: 2]) >>> pure)
    <> accountColumnView.map(gridColumn(sizes: [.mobile: 4, .desktop: 2]) >>> pure)
    <> moreColumnView.map(gridColumn(sizes: [.mobile: 4, .desktop: 2]) >>> pure)

private let legalView = View<Prelude.Unit> { _ in
  p([`class`([legalClass, Class.padding([.mobile: [.top: 2]])])], [
    "The content of this site is license under ",
    a([`class`([Class.pf.colors.link.gray650]), href("https://creativecommons.org/licenses/by-nc-sa/4.0/")], ["CC BY-NC-SA 4.0"]),
    ", and the underlying ",
    a([`class`([Class.pf.colors.link.gray650]), href(gitHubUrl(to: .repo(.pointfreeco)))], ["source code"]),
    " to run this site is licensed under the ",
    a([`class`([Class.pf.colors.link.gray650]), href(gitHubUrl(to: .license))], ["MIT license"]),
    ". Point-Free, Inc 2018."
    ])
}

private let pointFreeView = View<Prelude.Unit> { _ in
  div([`class`([Class.padding([.desktop: [.right: 4], .mobile: [.bottom: 2]])])], [
    h4([`class`([Class.pf.type.title4, Class.margin([.mobile: [.bottom: 0]])])], [
      a([href(path(to: .secretHome)), `class`([Class.pf.colors.link.white])], ["Point-Free"])
      ]),
    p([`class`([Class.pf.type.body.regular, Class.pf.colors.fg.white])], [
      "A weekly video series on functional programming and the Swift programming language. Hosted by ",
      a(
        [href(twitterUrl(to: .mbrandonw)), `class`([Class.type.textDecorationNone, Class.pf.colors.link.green])],
        ["Brandon Williams"]
      ),
      " and ",
      a(
        [href(twitterUrl(to: .stephencelis)), `class`([Class.type.textDecorationNone, Class.pf.colors.link.green])],
        ["Stephen Celis"]
      ),
      "."
      ]),
    ])
}

private let contentColumnView = View<Prelude.Unit> { _ in
  div([
    h5([`class`([columnTitleClass])], ["Content"]),
    ol([`class`([Class.type.list.reset])], [
      li([
        a([`class`([footerLinkClass]), href(path(to: .secretHome))], ["Videos"])
        ]),
      li([
        a([`class`([footerLinkClass]), href("http://www.fewbutripe.com")], ["Few, but ripe…"])
        ]),
      li([
        a([`class`([footerLinkClass]), href("http://www.stephencelis.com")], ["Stephen Celis"])
        ]),
      ])
    ])
}

private let accountColumnView = View<Prelude.Unit> { _ in
  div([
    h5([`class`([columnTitleClass])], ["Account"]),
    ol([`class`([Class.type.list.reset])], [
      li([
        a([`class`([footerLinkClass]), href("#")], ["Subscribe"])
        ]),
      li([
        a([`class`([footerLinkClass]), href(path(to: .pricing(nil)))], ["Pricing"])
        ]),
      ])
    ])
}

private let moreColumnView = View<Prelude.Unit> { _ in
  div([
    h5([`class`([columnTitleClass])], ["More"]),
    ol([`class`([Class.type.list.reset])], [
      li([
        a([`class`([footerLinkClass]), href(twitterUrl(to: .pointfreeco))], ["Twitter"])
        ]),
      li([
        a([`class`([footerLinkClass]), href(gitHubUrl(to: .organization))], ["GitHub"])
        ]),
      li([
        a([`class`([footerLinkClass]), mailto("support@pointfree.co")], ["Contact us"])
        ]),
      ])
    ])
}

private let footerClass =
  Class.grid.row
    | Class.padding([.mobile: [.all: 3], .desktop: [.all: 4]])
    | Class.pf.colors.bg.black

private let footerLinkClass =
  Class.pf.colors.link.purple
    | Class.pf.type.body.regular

private let columnTitleClass =
  Class.pf.type.title6
    | Class.pf.colors.fg.white

private let legalClass =
  Class.pf.colors.fg.gray400
    | Class.pf.type.body.small
