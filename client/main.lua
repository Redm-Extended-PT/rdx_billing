RDX  = nil

Citizen.CreateThread(function()
	while RDX == nil do
		TriggerEvent('rdx:getSharedObject', function(obj) rdx = obj end)
		Citizen.Wait(1000)
	end
end)

local isDead = false

function ShowBillsMenu()
	RDX.TriggerServerCallback('rdx_billing:getBills', function(bills)
		if #bills > 0 then
			RDX.UI.Menu.CloseAll()
			local elements = {}

			for k,v in ipairs(bills) do
				table.insert(elements, {
					label  = ('%s - <span style="color:red;">%s</span>'):format(v.label, _U('invoices_item', RDX.Math.GroupDigits(v.amount))),
					billId = v.id
				})
			end

			RDX.UI.Menu.Open('default', GetCurrentResourceName(), 'billing', {
				title    = _U('invoices'),
				align    = 'bottom-right',
				elements = elements
			}, function(data, menu)
				menu.close()

				RDX.TriggerServerCallback('rdx_billing:payBill', function()
					ShowBillsMenu()
				end, data.current.billId)
			end, function(data, menu)
				menu.close()
			end)
		else
			RDX.ShowNotification(_U('no_invoices'))
		end
	end)
end

RegisterCommand('showbills', function()
	if not isDead and not RDX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'billing') then
		ShowBillsMenu()
	end
end, false)

RegisterKeyMapping('showbills', _U('keymap_showbills'), 'keyboard', 'F7')

AddEventHandler('rdx:onPlayerDeath', function() isDead = true end)
AddEventHandler('rdx:onPlayerSpawn', function(spawn) isDead = false end)
