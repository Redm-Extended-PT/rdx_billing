# rdx_billing

This resource for RDX adds possibility for different jobs to send bills to players, for example making police units able to give people fines. It comes with a menu for paying bills, to open the menu the default keybind is `F7`.

There is a developer server event available in order to register bills in the database, see default resources for examples.

## Download & Installation

- Download https://github.com/Redm-Extended-PT/rdx_billing
- Put it in the `[rdx]` directory


## Installation
- Import `rdx_billing.sql` in your database
- Add this to your `server.cfg`:

```
ensure rdx_billing
```

## Usage
Press `[F7]` To show the billing menu

```lua
local amount                         = 100
local closestPlayer, closestDistance = RDX.Game.GetClosestPlayer()

if closestPlayer == -1 or closestDistance > 3.0 then
	RDX.ShowNotification('There\'s no players nearby!')
else
	TriggerServerEvent('rdx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_taxi', 'Taxi', amount)
end
```