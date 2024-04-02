module Robo (
  input clock, 
  input reset, 
  input head, 
  input left, 
  output reg avancar, 
  output reg girar
);

reg [1:0] Estado_Atual, Proximo_Estado;  // Registradores de estado

parameter Procurando_Muro = 2'b00, // Lista de parâmetros para os estados
          Rotacionando = 2'b01,
          Acompanhando_Muro = 2'b10;

initial begin
  Proximo_Estado = Procurando_Muro;
  Estado_Atual = Proximo_Estado;
end

always @(posedge clock, posedge reset) begin
  if (reset == 1'b1) begin
    Proximo_Estado <= Procurando_Muro;
  end
  else begin
    Estado_Atual <= Proximo_Estado;
    case(Estado_Atual)
      Procurando_Muro: begin
        if (head) begin
          Proximo_Estado <= Rotacionando;
        end
        else if (left) begin
          Proximo_Estado <= Acompanhando_Muro;
        end
        else begin
          Proximo_Estado <= Procurando_Muro;
        end
      end
      Rotacionando: begin
        if ({head, left} == 2'b01) begin
          Proximo_Estado <= Acompanhando_Muro;
        end
        else begin
          Proximo_Estado <= Rotacionando;
        end
      end
      Acompanhando_Muro: begin
        if (~left) begin
          Proximo_Estado <= Procurando_Muro;
        end
        else if (head) begin
          Proximo_Estado <= Rotacionando;
        end
        else begin
          Proximo_Estado <= Acompanhando_Muro;
        end
      end
      default: begin
        Proximo_Estado <= Procurando_Muro;
      end
    endcase
  end
end

always @(head, left, Estado_Atual) begin
  case(Estado_Atual)
    Procurando_Muro: begin
      if (head) begin
        avancar = 1'b0;
        girar = 1'b1;
      end
      else begin
        avancar = 1'b1;
        girar = 1'b0;
      end
    end
    Rotacionando: begin
      if ({head, left} == 2'b01) begin
        avancar = 1'b1;
        girar = 1'b0;
      end
      else begin
        avancar = 1'b0;
        girar = 1'b1;
      end
    end
    Acompanhando_Muro: begin
      if ({head, left} == 2'b01) begin
        avancar = 1'b1;
        girar = 1'b0;
      end
      else begin
        avancar = 1'b0;
        girar = 1'b1;
      end
    end
    default: begin
      avancar = 1'b0;
      girar = 1'b0;
    end
  endcase
end

endmodule
