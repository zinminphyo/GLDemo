// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// The episodes in the Star Wars trilogy
public enum Episode: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// Star Wars Episode IV: A New Hope, released in 1977.
  case newhope
  /// Star Wars Episode V: The Empire Strikes Back, released in 1980.
  case empire
  /// Star Wars Episode VI: Return of the Jedi, released in 1983.
  case jedi
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "NEWHOPE": self = .newhope
      case "EMPIRE": self = .empire
      case "JEDI": self = .jedi
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .newhope: return "NEWHOPE"
      case .empire: return "EMPIRE"
      case .jedi: return "JEDI"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: Episode, rhs: Episode) -> Bool {
    switch (lhs, rhs) {
      case (.newhope, .newhope): return true
      case (.empire, .empire): return true
      case (.jedi, .jedi): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [Episode] {
    return [
      .newhope,
      .empire,
      .jedi,
    ]
  }
}

public final class GetReviewsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query getReviews {
      reviews(episode: NEWHOPE) {
        __typename
        stars
        commentary
        episode
      }
    }
    """

  public let operationName: String = "getReviews"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("reviews", arguments: ["episode": "NEWHOPE"], type: .list(.object(Review.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(reviews: [Review?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "reviews": reviews.flatMap { (value: [Review?]) -> [ResultMap?] in value.map { (value: Review?) -> ResultMap? in value.flatMap { (value: Review) -> ResultMap in value.resultMap } } }])
    }

    public var reviews: [Review?]? {
      get {
        return (resultMap["reviews"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Review?] in value.map { (value: ResultMap?) -> Review? in value.flatMap { (value: ResultMap) -> Review in Review(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Review?]) -> [ResultMap?] in value.map { (value: Review?) -> ResultMap? in value.flatMap { (value: Review) -> ResultMap in value.resultMap } } }, forKey: "reviews")
      }
    }

    public struct Review: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Review"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("stars", type: .nonNull(.scalar(Int.self))),
        GraphQLField("commentary", type: .scalar(String.self)),
        GraphQLField("episode", type: .scalar(Episode.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(stars: Int, commentary: String? = nil, episode: Episode? = nil) {
        self.init(unsafeResultMap: ["__typename": "Review", "stars": stars, "commentary": commentary, "episode": episode])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The number of stars this review gave, 1-5
      public var stars: Int {
        get {
          return resultMap["stars"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "stars")
        }
      }

      /// Comment about the movie
      public var commentary: String? {
        get {
          return resultMap["commentary"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "commentary")
        }
      }

      /// The movie
      public var episode: Episode? {
        get {
          return resultMap["episode"] as? Episode
        }
        set {
          resultMap.updateValue(newValue, forKey: "episode")
        }
      }
    }
  }
}

public final class HeroQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query hero {
      hero(episode: EMPIRE) {
        __typename
        name
        friends {
          __typename
          name
        }
      }
    }
    """

  public let operationName: String = "hero"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("hero", arguments: ["episode": "EMPIRE"], type: .object(Hero.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(hero: Hero? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "hero": hero.flatMap { (value: Hero) -> ResultMap in value.resultMap }])
    }

    public var hero: Hero? {
      get {
        return (resultMap["hero"] as? ResultMap).flatMap { Hero(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "hero")
      }
    }

    public struct Hero: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Human", "Droid"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("friends", type: .list(.object(Friend.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public static func makeHuman(name: String, friends: [Friend?]? = nil) -> Hero {
        return Hero(unsafeResultMap: ["__typename": "Human", "name": name, "friends": friends.flatMap { (value: [Friend?]) -> [ResultMap?] in value.map { (value: Friend?) -> ResultMap? in value.flatMap { (value: Friend) -> ResultMap in value.resultMap } } }])
      }

      public static func makeDroid(name: String, friends: [Friend?]? = nil) -> Hero {
        return Hero(unsafeResultMap: ["__typename": "Droid", "name": name, "friends": friends.flatMap { (value: [Friend?]) -> [ResultMap?] in value.map { (value: Friend?) -> ResultMap? in value.flatMap { (value: Friend) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The name of the character
      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      /// The friends of the character, or an empty list if they have none
      public var friends: [Friend?]? {
        get {
          return (resultMap["friends"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Friend?] in value.map { (value: ResultMap?) -> Friend? in value.flatMap { (value: ResultMap) -> Friend in Friend(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Friend?]) -> [ResultMap?] in value.map { (value: Friend?) -> ResultMap? in value.flatMap { (value: Friend) -> ResultMap in value.resultMap } } }, forKey: "friends")
        }
      }

      public struct Friend: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Human", "Droid"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public static func makeHuman(name: String) -> Friend {
          return Friend(unsafeResultMap: ["__typename": "Human", "name": name])
        }

        public static func makeDroid(name: String) -> Friend {
          return Friend(unsafeResultMap: ["__typename": "Droid", "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The name of the character
        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }
    }
  }
}

public final class GetHerosAndFriendsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query getHerosAndFriends($episode: Episode) {
      hero(episode: $episode) {
        __typename
        ...HeroDetails
        friends {
          __typename
          ...HeroDetails
        }
      }
    }
    """

  public let operationName: String = "getHerosAndFriends"

  public var queryDocument: String { return operationDefinition.appending(HeroDetails.fragmentDefinition) }

  public var episode: Episode?

  public init(episode: Episode? = nil) {
    self.episode = episode
  }

  public var variables: GraphQLMap? {
    return ["episode": episode]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("hero", arguments: ["episode": GraphQLVariable("episode")], type: .object(Hero.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(hero: Hero? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "hero": hero.flatMap { (value: Hero) -> ResultMap in value.resultMap }])
    }

    public var hero: Hero? {
      get {
        return (resultMap["hero"] as? ResultMap).flatMap { Hero(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "hero")
      }
    }

    public struct Hero: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Human", "Droid"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(HeroDetails.self),
        GraphQLField("friends", type: .list(.object(Friend.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The friends of the character, or an empty list if they have none
      public var friends: [Friend?]? {
        get {
          return (resultMap["friends"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Friend?] in value.map { (value: ResultMap?) -> Friend? in value.flatMap { (value: ResultMap) -> Friend in Friend(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Friend?]) -> [ResultMap?] in value.map { (value: Friend?) -> ResultMap? in value.flatMap { (value: Friend) -> ResultMap in value.resultMap } } }, forKey: "friends")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var heroDetails: HeroDetails {
          get {
            return HeroDetails(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }

      public struct Friend: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Human", "Droid"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(HeroDetails.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public static func makeHuman(name: String, appearsIn: [Episode?]) -> Friend {
          return Friend(unsafeResultMap: ["__typename": "Human", "name": name, "appearsIn": appearsIn])
        }

        public static func makeDroid(name: String, appearsIn: [Episode?]) -> Friend {
          return Friend(unsafeResultMap: ["__typename": "Droid", "name": name, "appearsIn": appearsIn])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var heroDetails: HeroDetails {
            get {
              return HeroDetails(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public final class ReviewMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation review {
      createReview(episode: EMPIRE, review: {stars: 10}) {
        __typename
        commentary
        stars
        episode
      }
    }
    """

  public let operationName: String = "review"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createReview", arguments: ["episode": "EMPIRE", "review": ["stars": 10]], type: .object(CreateReview.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createReview: CreateReview? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createReview": createReview.flatMap { (value: CreateReview) -> ResultMap in value.resultMap }])
    }

    public var createReview: CreateReview? {
      get {
        return (resultMap["createReview"] as? ResultMap).flatMap { CreateReview(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createReview")
      }
    }

    public struct CreateReview: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Review"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("commentary", type: .scalar(String.self)),
        GraphQLField("stars", type: .nonNull(.scalar(Int.self))),
        GraphQLField("episode", type: .scalar(Episode.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(commentary: String? = nil, stars: Int, episode: Episode? = nil) {
        self.init(unsafeResultMap: ["__typename": "Review", "commentary": commentary, "stars": stars, "episode": episode])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Comment about the movie
      public var commentary: String? {
        get {
          return resultMap["commentary"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "commentary")
        }
      }

      /// The number of stars this review gave, 1-5
      public var stars: Int {
        get {
          return resultMap["stars"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "stars")
        }
      }

      /// The movie
      public var episode: Episode? {
        get {
          return resultMap["episode"] as? Episode
        }
        set {
          resultMap.updateValue(newValue, forKey: "episode")
        }
      }
    }
  }
}

public struct HeroDetails: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment HeroDetails on Character {
      __typename
      name
      appearsIn
    }
    """

  public static let possibleTypes: [String] = ["Human", "Droid"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("name", type: .nonNull(.scalar(String.self))),
    GraphQLField("appearsIn", type: .nonNull(.list(.scalar(Episode.self)))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public static func makeHuman(name: String, appearsIn: [Episode?]) -> HeroDetails {
    return HeroDetails(unsafeResultMap: ["__typename": "Human", "name": name, "appearsIn": appearsIn])
  }

  public static func makeDroid(name: String, appearsIn: [Episode?]) -> HeroDetails {
    return HeroDetails(unsafeResultMap: ["__typename": "Droid", "name": name, "appearsIn": appearsIn])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// The name of the character
  public var name: String {
    get {
      return resultMap["name"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  /// The movies this character appears in
  public var appearsIn: [Episode?] {
    get {
      return resultMap["appearsIn"]! as! [Episode?]
    }
    set {
      resultMap.updateValue(newValue, forKey: "appearsIn")
    }
  }
}
