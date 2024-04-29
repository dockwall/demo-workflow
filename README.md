# LittleDTDWorkflow

This is a Vite init template (React + TypeScript) with additions to automate the "Development => Testing => Deployment" cycle. Plus some custom CI/CD pipelines by GitHub actions with the VPS.

## Project dependencies

- `Docker` - dev, test and prod stages of the app are dockerized;
- `Vitest` - Vite-friendly testing framework;
- `nginx` - uses as server in the app prod stage;

## Manual use

To access the containers from the web (for example, the app dev and prod stages), run images with port forwarding (`docker run -p host:container ...`)

1. **dev stage**. Build a docker image with the app dev stage by `Dockerfile.dev` file (`docker build ... -f Dockerfile.dev .`). Then run it\*. Note that the container with the app dev stage uses `vite` web server (port `5173`, can be changed in `vite.config.ts`)

2. **test stage**. Build a dev stage image from previous step, and run it in interactive mode\* with new CMD: `docker run -it ... npm run test`

3. **prod stage**. Build a docker image with the app prod stage by `Dockerfile` file (`docker build ... -f Dockerfile .`). Note that the container with the app prod stage uses `nginx` as web server (port `80`)

\*If you want the container to monitor code changes and update without rebuild, please use docker bind mounts or volumes mechanisms

## Comfort developing and testing

There is a docker-compose config in this project. It gives a possibility to run dev and test containers together. The containers uses docker bind mounts, so their content dynamically updates when code changes

You can simply use this variant with `docker-compose up`. Note that dev container port is `5173`
