
###
## todo/check:
##    make all string values case-insensitive - why? why not?
##       orc-721 == ORC-721
##        mint   == MINT == Mint == mInT
##       diypunks == DiyPunks  etc.


def validate_mint( num, content, deploys: {} )
  errors = []

  ###  1) check for valid json
  h = nil
  begin
    h = JSON.parse( content )
    ## puts "   OK - json parse"
  rescue JSON::ParserError => ex
    msg = "json parse -- #{ex.message}"
    errors << msg
    ## puts "   !! ERROR - #{msg}"
  end

  if h
    ###  2) check for protocol required keys  - p,op,s,g
    ##          todo: allow (long-form) alternative for s e.g. slug
    ##          todo: allow (long-form) alternative for g e.g. generative?
    ['p','op','s','g'].each do |key|
       if h.has_key?( key )
          ## continue
       else
          msg = "protocol format -- required key '#{key}' not found in inscribe text"
          errors << msg
          ## puts "   !! ERROR - #{msg}"
       end
    end

    ## 3) check for protocol values
    if errors.size == 0
      value = h['p']
      if value != 'orc-721'
        msg = "protocol format -- expected value 'orc-721' for key 'p'; got '#{value}'"
        errors << msg
      end
    end

    if errors.size == 0
      value = h['op']
      if value != 'mint'
        msg = "protocol format -- expected value 'mint' for key 'op'; got '#{value}'"
        errors << msg
      end
    end


    if errors.size == 0
      slug = value = h['s']

       ## slug must use this regex (texp pattern) format
       ##  note: MUST start with a-z (NOT numbers or _-)
       ##  - todo/check - limt the length of slug at 64, 128 or such???
       ##     - check .com domain names - what is max length?
       ##
       ##  - todo/check - allow more special chars e.g. - dot(.) - why? why not?
       ##                                               - at(@)
       ##                                               - plus(+)
       ##   - again check / try to use format for .com domain names
       slug_re = /[a-z][a-z0-9_-]*/

       if slug_re.match( value ).nil?
        msg = "protocol format -- invalid slug '#{value}'; must use the format /[a-z][a-z0-9_-]*/"
        errors << msg
       else
        deploy = deploys[value]

        if deploy.nil?
          msg = "protocol -- no deploy found for slug '#{value}'"
          errors << msg
        else
         ###  check for mint ord num GREATER deploy ord num.
         ## pp deploy
         deploy_num = deploy['num']
         ## pp deploy_num
         if deploy_num > num
             msg = "protocol -- '#{slug}' mint inscribe no. #{num} lower than deploy inscribe no #{deploy_num}"
             errors << msg
         else
            ## check for g
            g = values =  h['g']
            if values.size == 0   ## empty array
              msg = "protocol format -- empty g"
              errors << msg
            end
            if errors.size == 0
              ## check for g in range of deploy
              ##   note: for now allow to repeat numbers e.g. [0,0,0] is ok
              ##          or [0,1,1,2,1,2]
              deploy_g = deploy['g']
               values.each do |value|
                   if value >= deploy_g
                     msg = "protocol --  g no. #{value} out-of-range 0-#{deploy_g-1} (#{deploy_g}) in '#{slug}' mint"
                     errors << msg
                  end
               end
            end
         end
        end
     end
    end
  end

  errors
end


