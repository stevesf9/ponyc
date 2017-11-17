use @pony_gc_trigger[None]()
use @pony_gc_now[None]()

primitive ControlGCAuth
  new create(from: AmbientAuth) => None

type GCAuth is (AmbientAuth | ControlGCAuth)

primitive GC
  fun apply(auth: GCAuth) =>
    @pony_gc_now()

  fun trigger(auth: GCAuth) =>
    @pony_gc_trigger()
