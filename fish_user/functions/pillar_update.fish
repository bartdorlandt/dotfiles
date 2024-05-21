function pillar_update
	docker exec -it salt '*' saltutil.refresh_pillar wait=True 
	sleep 5 
	docker exec -it salt '*' saltutil.sync_output
end
