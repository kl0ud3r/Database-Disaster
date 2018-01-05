#CreateSession

#global variables

$date = "1-5-18"
$appraiser = "Steve"
$filename = "class"
$baseUrl = "https://$filename.appraisalscope.com/login"

Write-Verbose "Connecting to $baseUrl"
$loginpage = Invoke-WebRequest -Uri "$baseUrl" -SessionVariable foo -Verbose

Start-Sleep -Seconds 10

#Authentication

$loginPage.Forms[0].Fields["username"] = "UserName"
$loginpage.Forms[0].Fields["password"] = "P@55Word!123"



Write-Verbose "Logging in to $baseUrl"
$dashboard = Invoke-WebRequest -Uri ("$baseUrl" + $loginpage.Forms.Action) -WebSession $foo -Method Post -Body $loginpage.Forms.Fields -Verbose

Start-Sleep -Seconds 10

#Get the data

$data = Invoke-WebRequest -uri "https://$filename.appraisalscope.com/index.php/admin/appraiserdashboard/get_appraisal_by_all?tm=849354" -Method get -WebSession $foo -Verbose



#Make the data look... good?


$parsed = $data.Content -replace '.*Accepted":','>Accepted:<'

$parsed = $parsed -replace '","paginationLinks":.*',''

$parsed = $parsed -replace 'ds_tr_','>'

$parsed = $parsed -replace '(>3\d{5})','\1<'

$parsed = $parsed -replace '<[^>]+',''

$parsed = $parsed.Split(@(">"))

$parsed = $parsed -replace 'Accepted:',''

$parsed = $parsed.replace('\n', '')

$parsed = $parsed.replace('\', '')

$parsed = $parsed.replace('rtt','')

$parsed = $parsed.replace('"','')

$parsed = $parsed.replace(',','')

$parsed = $parsed.replace('last_update:fil_appraiser:','')

$parsed = $parsed.replace('Show All','')

$parsed = $parsed.replace('}','')

$parsed = $parsed.replace('update_fil_appraiser:1update_fil_client:1update_fil_state:1update_fil_jobtypes:1','')

$parsed = $parsed.replace('fil_','')

$parsed = $parsed.replace('paginationLinks:perpage:','')

$parsed = $parsed.replace('Per Page','')

$parsed = $parsed.replace('{','')

$parsed = $parsed.replace('relogin:data:','')

$parsed = $parsed -replace '^\s*[^\w]',''





#when finished write results to file



$finished = $parsed

Out-File -Append $env:HOMEPATH\Desktop\DueDates\"$date"Accepted_scrape.txt -InputObject $finished

Start-Sleep -Seconds 10

#get rid of extra blank lines


$deleteLines = Get-Content C:\Users\admin\Desktop\DueDates\"$date"Accepted_scrape.txt

$deleteLines |Where-Object {$_} | Set-Content C:\Users\admin\Desktop\DueDates\"$date"Accepted_scrape.txt