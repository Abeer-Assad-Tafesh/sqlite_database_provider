
abstract class DbOperations<T>{
  // T => Is a generic type (undefine on compile time, but define at runtime)
  /*
   * CRUD operations:
   * C => Create
   * R => Read
   * U => Update
   * D => Delete
   */

  Future<int> create(T object);

  Future<List<T>> read();

  Future<T?> show(int id);

  Future<bool> update(T object);

  Future<bool> delete(int id);


 }