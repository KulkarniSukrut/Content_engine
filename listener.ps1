while ($true) {
    try {
        Write-Host "---- NEW LOOP ----"

        # Topic pool
        $topics = @(
            "AI tools making money",
            "side hustles with AI",
            "passive income online",
            "future tech money",
            "online business ideas"
        )

        # Pick random topic
        $randomTopic = Get-Random $topics
        Write-Host "Topic: $randomTopic"

        # Encode topic (IMPORTANT)
        $encodedTopic = [System.Uri]::EscapeDataString($randomTopic)

        # Call webhook
        $url = "http://localhost:5678/webhook/run-video?topic=$encodedTopic"
        Write-Host "Calling: $url"

        $response = Invoke-RestMethod -Uri $url

        # Extract raw content
        $rawContent = $response[0].choices[0].message.content
        Write-Host "Got response ✅"

        # Convert JSON safely
        try {
            $content = $rawContent | ConvertFrom-Json
        } catch {
            Write-Host "JSON failed — fallback"
            $content = @{
                script = $rawContent
                title = "AI Money Hack"
                description = "Generated content"
            }
        }

        # Extract values
        $script = $content.script
        $title = $content.title
        $description = $content.description

        # Save files
        $script | Out-File -FilePath "C:\Users\user\Documents\All projects\Content_engine\script.txt" -Encoding utf8
        $title | Out-File -FilePath "C:\Users\user\Documents\All projects\Content_engine\title.txt" -Encoding utf8
        $description | Out-File -FilePath "C:\Users\user\Documents\All projects\Content_engine\description.txt" -Encoding utf8

        Write-Host "Files updated ✅"

        # Run video generator
        Start-Process "C:\Users\user\Documents\All projects\Content_engine\run.bat"

        Start-Sleep -Seconds 25
    }
    catch {
        Write-Host "ERROR OCCURRED"
        Write-Host $_
        Start-Sleep -Seconds 5
    }
}