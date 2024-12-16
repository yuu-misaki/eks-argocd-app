from fastapi import FastAPI

app = FastAPI(root_path="/app1")


@app.get("/")
async def root():
    return {"message": "Hello World"}


@app.get("/v1/greet/{name}")
async def greet(name: str):
    return {"message": f"Hello {name}"}
