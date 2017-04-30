import asyncdispatch

import nimongo.bson, nimongo.mongo

export bson, mongo

var
  db*: Database[AsyncMongo]

var
  mongoInstance: AsyncMongo

proc connect*(host: string, port: uint16): Future[bool] {.async.} =
  mongoInstance = newAsyncMongo(host, port)

  let connected = await mongoInstance.connect()

  if connected:
    db = mongoInstance["conduit"]

    result = true

  return
