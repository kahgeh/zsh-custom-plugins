# App background

I reckon that I waste 5-10 minutes a day login in to AWS console, assuming roles and switching to the right region to get to one of the environments in aws ( possibly caused by lack of federated auth ).  

Here's an app built by someone facing the same issue :  

https://github.com/glassechidna/awsweb

# What the completion provides

1. First level commands
2. When the first level command is browser, it will extract out the profile names to the completion list

# Prerequisite

- Powershell

# Troubleshooting

- Completion does not appear, run `rm ~/.zcompdump*`