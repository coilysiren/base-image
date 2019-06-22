# lynncyrin/base-image

A personalized and well documented [docker](https://www.docker.com/) dev time base image.

## Usage

```bash
docker pull lynncyrin/base-image
docker run -it lynncyrin/base-image
```

I'd actually prefer (but do not enforce) that you do not use my base image, unless:

- I ask you to use it (generally for working on something with me)
- You're using it to work on one of my repos

I say this because I provide no long-term garuntees about the contents / correctness of my base image. This contrasts with software I'm creating with the intention of people using it, such as [py-sh](https://github.com/lynncyrin/py-sh).

Instead, you should copy paste / fork (whichever you prefer) this repo and create your own! Personalize your base image like you'd personalize your laptop, or your living room ✨

## Status

High level components added:

- [x] python
- [ ] golang
- [ ] nodejs
- [ ] rustlang
- [ ] ruby

## Motivation and Context

I do my dev work on both osx and windows, so its nice to have a linux container to work in. Every so often an install will break on a dev machine (my osx rust install is currently broken) - and doing dev work in a container completely solves that problem.

At this point in my career, I'm consistently writing in a variety of different languages. To ease the effort it takes to context switch (and also mirror local dev) its nice to have a docker container that contains all my languages.

I'm an infrastructure engineer, so exactly how each language is built is very interesting to me! So I'm building each language from source, rather than copying for pre-built sources. This also makes it slightly easier for me to do dev work on the language itself (I'm currently planning on doing this for `python`)

It you're thinking of doing something similar for personal use, but don't want to deal with so much docker / ubuntu / bash, then `docker run -it python bash` (or whatever language) works perfectly fine! I don't reccommend going through the effort of curating a base / dev image unless you really want to.
