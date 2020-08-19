import Array "mo:base/Array";
import Iter "mo:base/Iter";

module {
  // just used by Rand right now
  public func tail<A>(arr : [A]) : [A] { slice(arr, 1, arr.len() - 1) };
  public func last<A>(arr : [A]) : A { arr[arr.len() - 1] };
};