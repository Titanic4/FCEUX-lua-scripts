local OldI;
local I;
local counter = 0;
local limit = 0
local Keyboard = {
  zero = false,
  one = false,
  two = false,
  three = false,
  four = false,
  five = false,
  six = false,
  seven = false,
  eight = false,
  nine = false,
  Shift = false, --shift has an exception from the debouncing...
  space = false, --shift has an exception from the debouncing...
  A = false,
  B = false,
  C = false,
  D = false,
  E = false,
  F = false,
  G = false,
  H = false,
  I = false,
  J = false,
  K = false,
  L = false,
  M = false,
  N = false,
  O = false,
  P = false,
  Q = false,
  R = false,
  S = false,
  T = false,
  U = false,
  V = false,
  W = false,
  X = false,
  Y = false,
  Z = false,
  backspace = false,
  enter = false}
  
local debounce = false;
print("When prompted, you'll get the following controls:")
print("Shift+Backspace - Clear all")
print("ENTER/RETURN - confirm")
print("FCEUX's controllers will be locked while using keyboard")
print("Once you confirm the name/answer, or the script is shut down, all the controllers will be unlocked.")

if(memory.readbyte(0x86) == 1 and memory.readbyte(0x68) == 8) then
  
  for i=0xd46,0xd46+0x1a do
    memory.writebyte(i, 0x00)
    
  end
  memory.writebyte(0x76, 0)
end
if(memory.readbyte(0x68) == 1 and memory.readbyte(0x70) ~= 0 and memory.readbyte(0x77) ~= 0 ) then 

  for i=0xd06,0xd06+(0x6*memory.readbyte(0x77)) do
    memory.writebyte(i, 0x00)
  end
end


function update()
  
  I = input.get()
  
 
 
  if(memory.readbyte(0x68) == 1 and memory.readbyte(0x70) == 1 ) then limit = 6 end
  if(memory.readbyte(0x86) == 1 and memory.readbyte(0x68) == 8) then limit = 0x1a end
  if(memory.readbyte(0x68) == 1 and memory.readbyte(0x70) ~= 0 and memory.readbyte(0x77) ~= 0 ) then -- for the name entry
    
    joypad.set(1, {A = false,B = false,up=false,down=false,left = false,right=false, select=false,start = false})
    joypad.set(2, {A = false,B = false,up=false,down=false,left = false,right=false, select=false,start = false})

    gui.text(25,40,"Use the keyboard to type the name")
  
    
      if(I ~= oldI) then
      OldI = I
    if(not debounce) then
      debounce = true
      local ply = (memory.readbyte(0x77)*6)-6
      if(ply == 1524 or ply == -6) then counter = 0 end --hard reset or soft one, doesnt matter...
      if(I.enter and not Keyboard.enter ) then

        counter = 0;
        Keyboard.enter = true
        memory.writebyte(0x6c, 0xD0) memory.writebyte(0x6A, 0xDA) counter =0
        joypad.set(1, {A = true,B = false,up=false,down=false,left = false,right=false, select=false,start = false})
        joypad.set(2, {A = true,B = false,up=false,down=false,left = false,right=false, select=false,start = false})


      end
      if(I.backspace and not Keyboard.backspace) then
      if(I.shift ~= nil and counter > 0 ) then
       
        for i=0xd06,0xd06+(0x6*memory.readbyte(0x77)) do
          memory.writebyte(i, 0x00)
        end
        counter = 0
      else
        if(counter > 0) then Keyboard.backspace = true counter = counter - 1 memory.writebyte(0xd07+counter+ ply, 0x00)   end
      end
    end


      if(counter < limit) then

      
      if(not Keyboard.A and I.A) then memory.writebyte(0xd07+counter+ ply, 0xC1) counter = counter + 1 Keyboard.A = true  end
      if(not Keyboard.B and I.B) then memory.writebyte(0xd07+counter+ ply , 0xC2) counter = counter + 1 Keyboard.B = true  end
      if(not Keyboard.C and I.C) then memory.writebyte(0xd07+counter+ ply , 0xC3) counter = counter + 1 Keyboard.C = true  end
      if(not Keyboard.D and I.D) then memory.writebyte(0xd07+counter+ ply , 0xC4) counter = counter + 1 Keyboard.D = true  end
      if(not Keyboard.E and I.E) then memory.writebyte(0xd07+counter+ ply , 0xC5) counter = counter + 1 Keyboard.E = true  end
      if(not Keyboard.F and I.F) then memory.writebyte(0xd07+counter+ ply , 0xC6) counter = counter + 1 Keyboard.F = true  end
      if(not Keyboard.G and I.G) then memory.writebyte(0xd07+counter+ ply , 0xC7) counter = counter + 1 Keyboard.G = true  end
      if(not Keyboard.H and I.H) then memory.writebyte(0xd07+counter+ ply , 0xC8) counter = counter + 1 Keyboard.H = true  end
      if(not Keyboard.I and I.I) then memory.writebyte(0xd07+counter+ ply , 0xC9) counter = counter + 1 Keyboard.I = true  end
      if(not Keyboard.J and I.J) then memory.writebyte(0xd07+counter+ ply , 0xCA) counter = counter + 1 Keyboard.J = true  end
      if(not Keyboard.K and I.K ) then memory.writebyte(0xd07+counter+ ply , 0xCB) counter = counter + 1 Keyboard.K = true  end
      if(not Keyboard.L and I.L) then memory.writebyte(0xd07+counter+ ply , 0xCC) counter = counter + 1 Keyboard.L = true  end
      if(not Keyboard.M and I.M ) then memory.writebyte(0xd07+counter+ ply , 0xCD) counter = counter + 1 Keyboard.M = true  end
      if(not Keyboard.N and I.N) then memory.writebyte(0xd07+counter+ ply , 0xCE) counter = counter + 1 Keyboard.N = true  end
      if(not Keyboard.O and I.O) then memory.writebyte(0xd07+counter+ ply , 0xCF) counter = counter + 1 Keyboard.O = true  end
      if(not Keyboard.P and I.P) then memory.writebyte(0xd07+counter+ ply , 0xD0) counter = counter + 1 Keyboard.P = true  end
      if(not Keyboard.Q and I.Q) then memory.writebyte(0xd07+counter+ ply , 0xD1) counter = counter + 1 Keyboard.Q = true  end
      if(not Keyboard.R and I.R) then memory.writebyte(0xd07+counter+ ply , 0xD2) counter = counter + 1 Keyboard.R = true  end
      if(not Keyboard.S and I.S) then memory.writebyte(0xd07+counter+ ply , 0xD3) counter = counter + 1 Keyboard.S = true  end
      if(not Keyboard.T and I.T) then memory.writebyte(0xd07+counter+ ply , 0xD4) counter = counter + 1 Keyboard.T = true  end
      if(not Keyboard.U and I.U) then memory.writebyte(0xd07+counter+ ply , 0xD5) counter = counter + 1 Keyboard.U = true  end
      if(not Keyboard.V and I.V) then memory.writebyte(0xd07+counter+ ply , 0xD6) counter = counter + 1 Keyboard.V = true  end
      if(not Keyboard.W and I.W) then memory.writebyte(0xd07+counter+ ply , 0xD7) counter = counter + 1 Keyboard.W = true  end
      if(not Keyboard.X and I.X) then memory.writebyte(0xd07+counter+ ply , 0xD8) counter = counter + 1 Keyboard.X = true  end
      if(not Keyboard.Y and I.Y) then memory.writebyte(0xd07+counter+ ply , 0xD9) counter = counter + 1 Keyboard.Y = true  end
      if(not Keyboard.Z and I.Z) then memory.writebyte(0xd07+counter+ ply , 0xDA) counter = counter + 1 Keyboard.Z = true  end
    end
 

    if( debounce) then

      if(I.A == nil ) then debounce = false Keyboard.A = false end
      if( I.B == nil) then debounce = false Keyboard.B = false end
      if( I.C == nil) then debounce = false Keyboard.C = false end
      if( I.D == nil) then debounce = false Keyboard.D = false end
      if( I.E == nil) then debounce = false Keyboard.E = false end
      if( I.F == nil) then debounce = false Keyboard.F = false end
      if( I.G == nil) then debounce = false Keyboard.G = false end
      if( I.H == nil) then debounce = false Keyboard.H = false end
      if( I.I == nil) then debounce = false Keyboard.I = false end
      if( I.J == nil) then debounce = false Keyboard.J = false end
      if( I.K == nil) then debounce = false Keyboard.K = false end
      if( I.L == nil) then debounce = false Keyboard.L = false end
      if( I.M == nil) then debounce = false Keyboard.M = false end
      if( I.N == nil) then debounce = false  Keyboard.N = false end
      if( I.O == nil) then debounce = false  Keyboard.O = false end
      if( I.P == nil) then debounce = false  Keyboard.P= false end
      if( I.Q == nil) then debounce = false  Keyboard.Q = false end
      if( I.R == nil) then debounce = false  Keyboard.R = false end
      if( I.S == nil) then debounce = false  Keyboard.S = false end
      if( I.T == nil) then debounce = false  Keyboard.T = false end
      if( I.U == nil) then debounce = false  Keyboard.U = false end
      if( I.V == nil) then debounce = false  Keyboard.V = false end
      if( I.W == nil) then debounce = false  Keyboard.W = false end
      if( I.X == nil) then debounce = false  Keyboard.X = false end
      if( I.Y == nil) then debounce = false  Keyboard.Y = false end
      if( I.Z == nil) then debounce = false  Keyboard.Z = false end
      if( I.enter == nil) then debounce = false  Keyboard.enter = false end
      if( I.backspace == nil) then debounce = false  Keyboard.backspace = false end
    end
  end
end
  elseif(memory.readbyte(0x86) == 1 and memory.readbyte(0x68) == 8) then -- for the answer entry
 
    Keyboard.shift = not ( I.shift == nil)
    joypad.set(1, {A = false,B = false,up=false,down=false,left = false,right=false, select=false,start = false})
    joypad.set(2, {A = false,B = false,up=false,down=false,left = false,right=false, select=false,start = false})
    gui.text(25,10,"Use the keyboard to type the answer")

    
    
    
    if( I.space == true and Keyboard.space == false and not Keyboard.Shift ) then memory.writebyte(0xd46+counter, 0x00) counter = counter + 1 Keyboard.space = true end

     
  

      if(I.enter and not Keyboard.enter ) then


        Keyboard.enter = true
        memory.writebyte(0x6a, 0xC0) memory.writebyte(0x6c, 0xc0) counter =0
        joypad.set(1, {A = true,B = false,up=false,down=false,left = false,right=false, select=false,start = false})
        joypad.set(2, {A = true,B = false,up=false,down=false,left = false,right=false, select=false,start = false})

        
      end
    
      if(I.backspace and not Keyboard.backspace) then
        if(I.shift ~= nil and counter > 0 ) then
          
          for i=0xd46,0xd46+0x1a do
            memory.writebyte(i, 0x00)
            
          end
          memory.writebyte(0x76, 0)
          counter = 0;
        else
        if(counter > 0) then Keyboard.backspace = true counter = counter - 1 memory.writebyte(0xd46+counter, 0x00)   end
        end
      end
      if(not debounce) then
        debounce = true



        if(counter < limit) then
          
         
      if( (I['0'] or I.numpad0) and not Keyboard.zero ) then  memory.writebyte(0xd46+counter, 0x04) counter = counter + 1  Keyboard.zero = true end --&
      if( (I['1']  or I.numpad1) and not Keyboard.one  ) then memory.writebyte(0xd46+counter, 0x05) counter = counter + 1  Keyboard.one = true end --&
      if( (I['2']  or I.numpad2) and not Keyboard.two  ) then memory.writebyte(0xd46+counter, 0x06) counter = counter + 1  Keyboard.two= true end --&
      if( (I['3']  or I.numpad3) and not Keyboard.three  ) then memory.writebyte(0xd46+counter, 0x07) counter = counter + 1 Keyboard.three= true end --&
      if( (I['4']  or I.numpad4) and not Keyboard.four  ) then memory.writebyte(0xd46+counter, 0x08) counter = counter + 1 Keyboard.four = true end --&
      if( (I['5']  or I.numpad5) and not Keyboard.five  ) then memory.writebyte(0xd46+counter, 0x09) counter = counter + 1 Keyboard.five = true end --&
      if( (I['6']  or I.numpad6) and not Keyboard.six  ) then memory.writebyte(0xd46+counter, 0x0A) counter = counter + 1  Keyboard.six = true end --&
      if( (I['7']  or I.numpad7) and not Keyboard.seven  ) then if(I.shift ~= nil and I.numpad7 == nil) then memory.writebyte(0xd46+counter, 0x35) else memory.writebyte(0xd46+counter, 0x0B) end counter = counter + 1 Keyboard.seven = true end --& and 7
      if( (I['8']  or I.numpad8) and not Keyboard.eight  ) then memory.writebyte(0xd46+counter, 0x0C) counter = counter + 1 Keyboard.eight = true end --&
      if( (I['9']  or I.numpad9) and not Keyboard.nine  ) then memory.writebyte(0xd46+counter, 0x0D) counter = counter + 1  Keyboard.nine = true end --&
      
      if(not Keyboard.A and I.A) then memory.writebyte(0xd46+counter, 0x15) counter = counter + 1 Keyboard.A = true  end
      if(not Keyboard.B and I.B) then memory.writebyte(0xd46+counter, 0x16) counter = counter + 1 Keyboard.B = true  end
      if(not Keyboard.C and I.C) then memory.writebyte(0xd46+counter, 0x17) counter = counter + 1 Keyboard.C = true  end
      if(not Keyboard.D and I.D) then memory.writebyte(0xd46+counter, 0x18) counter = counter + 1 Keyboard.D = true  end
      if(not Keyboard.E and I.E) then memory.writebyte(0xd46+counter, 0x19) counter = counter + 1 Keyboard.E = true  end
      if(not Keyboard.F and I.F) then memory.writebyte(0xd46+counter, 0x1A) counter = counter + 1 Keyboard.F = true  end
      if(not Keyboard.G and I.G) then memory.writebyte(0xd46+counter, 0x1B) counter = counter + 1 Keyboard.G = true  end
      if(not Keyboard.H and I.H) then memory.writebyte(0xd46+counter, 0x1C) counter = counter + 1 Keyboard.H = true  end
      if(not Keyboard.I and I.I) then memory.writebyte(0xd46+counter, 0x1D) counter = counter + 1 Keyboard.I = true  end
      if(not Keyboard.J and I.J) then memory.writebyte(0xd46+counter, 0x1E) counter = counter + 1 Keyboard.J = true  end
      if(not Keyboard.K and I.K ) then memory.writebyte(0xd46+counter, 0x1F) counter = counter + 1 Keyboard.K = true  end
      if(not Keyboard.L and I.L) then memory.writebyte(0xd46+counter, 0x20) counter = counter + 1 Keyboard.L = true  end
      if(not Keyboard.M and I.M ) then memory.writebyte(0xd46+counter, 0x21) counter = counter + 1 Keyboard.M = true  end
      if(not Keyboard.N and I.N) then memory.writebyte(0xd46+counter, 0x22) counter = counter + 1 Keyboard.N = true  end
      if(not Keyboard.O and I.O) then memory.writebyte(0xd46+counter, 0x23) counter = counter + 1 Keyboard.O = true  end
      if(not Keyboard.P and I.P) then memory.writebyte(0xd46+counter, 0x24) counter = counter + 1 Keyboard.P = true  end
      if(not Keyboard.Q and I.Q) then memory.writebyte(0xd46+counter, 0x25) counter = counter + 1 Keyboard.Q = true  end
      if(not Keyboard.R and I.R) then memory.writebyte(0xd46+counter, 0x26) counter = counter + 1 Keyboard.R = true  end
      if(not Keyboard.S and I.S) then memory.writebyte(0xd46+counter, 0x27) counter = counter + 1 Keyboard.S = true  end
      if(not Keyboard.T and I.T) then memory.writebyte(0xd46+counter, 0x28) counter = counter + 1 Keyboard.T = true  end
      if(not Keyboard.U and I.U) then memory.writebyte(0xd46+counter, 0x29) counter = counter + 1 Keyboard.U = true  end
      if(not Keyboard.V and I.V) then memory.writebyte(0xd46+counter, 0x2A) counter = counter + 1 Keyboard.V = true  end
      if(not Keyboard.W and I.W) then memory.writebyte(0xd46+counter, 0x2B) counter = counter + 1 Keyboard.W = true  end
      if(not Keyboard.X and I.X) then memory.writebyte(0xd46+counter, 0x2C) counter = counter + 1 Keyboard.X = true  end
      if(not Keyboard.Y and I.Y) then memory.writebyte(0xd46+counter, 0x2D) counter = counter + 1 Keyboard.Y = true  end
      if(not Keyboard.Z and I.Z) then memory.writebyte(0xd46+counter, 0x2E) counter = counter + 1 Keyboard.Z = true  end
      memory.writebyte(0x76, counter)
        elseif(counter == limit) then
         
        else
         
          for i=0xd46,0xd46-(counter-limit) do
            memory.writebyte(i, 0x00)
               
          end
          counter = counter - (counter - limit)
          memory.writebyte(0x76, counter)  
          
    end
    

    if( debounce) then
      
      if(I.A == nil ) then debounce = false Keyboard.A = false end
      if( I.B == nil) then debounce = false Keyboard.B = false end
      if( I.C == nil) then debounce = false Keyboard.C = false end
      if( I.D == nil) then debounce = false Keyboard.D = false end
      if( I.E == nil) then debounce = false Keyboard.E = false end
      if( I.F == nil) then debounce = false Keyboard.F = false end
      if( I.G == nil) then debounce = false Keyboard.G = false end
      if( I.H == nil) then debounce = false Keyboard.H = false end
      if( I.I == nil) then debounce = false Keyboard.I = false end
      if( I.J == nil) then debounce = false Keyboard.J = false end
      if( I.K == nil) then debounce = false Keyboard.K = false end
      if( I.L == nil) then debounce = false Keyboard.L = false end
      if( I.M == nil) then debounce = false Keyboard.M = false end
      if( I.N == nil) then debounce = false  Keyboard.N = false end
      if( I.O == nil) then debounce = false  Keyboard.O = false end
      if( I.P == nil) then debounce = false  Keyboard.P= false end
      if( I.Q == nil) then debounce = false  Keyboard.Q = false end
      if( I.R == nil) then debounce = false  Keyboard.R = false end
      if( I.S == nil) then debounce = false  Keyboard.S = false end
      if( I.T == nil) then debounce = false  Keyboard.T = false end
      if( I.U == nil) then debounce = false  Keyboard.U = false end
      if( I.V == nil) then debounce = false  Keyboard.V = false end
      if( I.W == nil) then debounce = false  Keyboard.W = false end
      if( I.X == nil) then debounce = false  Keyboard.X = false end
      if( I.Y == nil) then debounce = false  Keyboard.Y = false end
      if( I.Z == nil) then debounce = false  Keyboard.Z = false end
      if( I.enter == nil) then debounce = false  Keyboard.enter = false end
      if( I.backspace == nil) then debounce = false  Keyboard.backspace = false end
      if( I["0"] == nil and I.numpad0 == nil) then debounce = false  Keyboard.zero = false end
      if( I['1'] == nil and I.numpad1 == nil) then debounce = false  Keyboard.one = false end
      if( I['2'] == nil and I.numpad2 == nil) then debounce = false  Keyboard.two = false end
      if( I['3'] == nil and I.numpad3 == nil) then debounce = false  Keyboard.three = false end
      if( I['4'] == nil and I.numpad4 == nil) then debounce = false  Keyboard.four = false end
      if( I['5'] == nil and I.numpad5 == nil) then debounce = false  Keyboard.five = false end
      if( I['6'] == nil and I.numpad6 == nil) then debounce = false  Keyboard.six = false end
      if( I['7'] == nil and I.numpad7 == nil) then debounce = false  Keyboard.seven = false end
      if( I['8'] == nil and I.numpad8 == nil) then debounce = false  Keyboard.eight = false end
      if( I['9'] == nil and I.numpad9 == nil) then debounce = false  Keyboard.nine = false end
     
      if( I.space == nil) then debounce = false  Keyboard.space = false end
     
      
    
  end
end
    if(memory.readbyte(0x86) == 0) then -- for everything else
      
    joypad.set(1, {A = nil,B = nil,up=nil,down=nil,left = nil,right=nil, select=nil,start = nil})
    joypad.set(2, {A = nil,B = nil,up=nil,down=nil,left = nil,right=nil, select=nil,start = nil})

  end

end
end




emu.registerafter(update)
