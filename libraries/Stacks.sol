library Stacks {
  using Stacks for Stack;

  struct Stack {
    uint256[] _items;
  }

  function pushElement(Stack storage self, uint256 element)
    internal
    returns (bool)
  {
    self._items.push(element);
    return true;
  }

  function popElement(Stack storage self) internal returns (uint256) {
    uint256 element = self.peek();

    if (self._items.length > 0) {
      delete self._items[self._items.length - 1];
    }

    return element;
  }

  function peek(Stack storage self) internal view returns (uint256) {
    uint256 value;

    if (self._items.length > 0) {
      value = self._items[self._items.length - 1];
    }

    return value;
  }

  function length(Stack storage self) internal view returns (uint256) {
    return self._items.length;
  }
}