use "gc"

actor Segfaults
  new create(env: Env) =>
    var count: U64 = 1
    while (true) do
      count = count + 1
      let y = recover val
        let s = String
        s.>append(count.string())
      end
      if ((count % 10_000) == 0) then
        env.out.print(y)
      end
        try
          GC(env.root as AmbientAuth)
        end
    end

actor PrintsJunkToStdout
  var y: String val = ""
  let e: Env

  new create(env: Env) =>
    e = env
    var count: U32 = 1
    while (true) do
      count = count + 1
      y = recover val String.from_utf32(count) end
      if ((count % 10_000) == 0) then
        e.out.print(y)
      end
      try
        GC(e.root as AmbientAuth)
      end
    end
